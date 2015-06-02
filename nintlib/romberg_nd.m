function [ result, ind, eval_num ] = romberg_nd ( func, a, b, dim_num, sub_num, ...
  it_max, tol )

%*****************************************************************************80
%
%% ROMBERG_ND estimates a multidimensional integral using Romberg integration.
%
%  Discussion:
%
%    The routine uses a Romberg method based on the midpoint rule.
%
%    In the reference, this routine is called "NDIMRI".
%
%    Thanks to Barak Bringoltz for pointing out problems in a previous
%    FORTRAN90 implementation of this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2007
%
%  Author:
%
%    Original FORTRAN77 version by Philip Davis, Philip Rabinowitz.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function to be evaluated.
%
%    Input, real A(DIM_NUM), B(DIM_NUM), the integration limits.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer SUB_NUM(DIM_NUM), the number of subintervals into
%    which the I-th integration interval (A(I), B(I)) is
%    initially subdivided.  SUB_NUM(I) must be greater than 0.
%
%    Input, integer IT_MAX, the maximum number of iterations to
%    be performed.  The number of function evaluations on
%    iteration J is at least J**DIM_NUM, which grows very rapidly.
%    IT_MAX should be small!
%
%    Input, real TOL, an error tolerance for the approximation
%    of the integral.
%
%    Output, real RESULT, the approximate value of the integral.
%
%    Output, integer IND, error return flag.
%    IND = -1 if the error tolerance could not be achieved.
%    IND = 1 if the error tolerance was achieved.
%
%    Output, integer EVAL_NUM, the number of function evaluations.
%
%  Local Parameters:
%
%    Local, integer IWORK(DIM_NUM), a pointer used to generate all the
%    points X in the product region.
%
%    Local, integer IWORK2(IT_MAX), a counter of the number of points
%    used at each step of the Romberg iteration.
%
%    Local, integer SUB_NUM2(DIM_NUM), the number of subintervals used
%    in each direction, a refinement of the user's input SUB_NUM.
%
%    Local, real TABLE(IT_MAX), the difference table.
%
%    Local, real X(DIM_NUM), an evaluation point.
%
  eval_num = 0;

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROMBERG_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM is less than 1.  DIM_NUM = %d\n', dim_num );
    error ( 'ROMBERG_ND - Fatal error!' );
  end
 
  if ( it_max < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROMBERG_ND - Fatal error!\n' );
    fprintf ( 1, '  IT_MAX is less than 1.  IT_MAX = %d\n', it_max );
    error ( 'ROMBERG_ND - Fatal error!' );
  end
 
  for i = 1 : dim_num
    if ( sub_num(i) <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'ROMBERG_ND - Fatal error!\n' );
      fprintf ( 1, '  SUB_NUM(I) is less than 1.\n' );
      fprintf ( 1, '  for I = %d\n', i );
      fprintf ( 1, '  SUB_NUM(I) = %d\n', sub_num(i) );
      error ( 'ROMBERG_ND - Fatal error!' );
    end
  end
 
  ind = 0;
  rnderr = eps;
  iwork2(1) = 1;
  sub_num2(1:dim_num) = sub_num(1:dim_num);
 
  if ( 1 < it_max )
    iwork2(2) = 2;
  end
 
  it = 1;
 
  while ( 1 )
 
    sum1 = 0.0;
 
    weight = prod ( ( b(1:dim_num) - a(1:dim_num) ) ./ sub_num2(1:dim_num) );
%
%  Generate every point X in the product region, and evaluate F(X).
%
    iwork(1:dim_num) = 1;
    
    while ( 1 )

      x(1:dim_num) = ...
       (  ( 2 * sub_num2(1:dim_num) - 2 * iwork(1:dim_num) + 1 ) .* a(1:dim_num)   ...
       +  (                         + 2 * iwork(1:dim_num) - 1 ) .* b(1:dim_num) ) ...
       ./ ( 2 * sub_num2(1:dim_num) );

      sum1 = sum1 + feval ( func, dim_num, x );
      eval_num = eval_num + 1;

      kdim = dim_num;

      while ( 0 < kdim ) 

        if ( iwork(kdim) < sub_num2(kdim) )
          iwork(kdim) = iwork(kdim) + 1;
          break
        end

        iwork(kdim) = 1;

        kdim = kdim - 1;

      end

      if ( kdim == 0 )
        break
      end

    end
%
%  Done with summing.
%
    table(it) = weight * sum1;

    if ( it <= 1 )

      result = table(1);
      result_old = result;

      if ( it_max <= it )
        ind = 1;
        break
      end

      it = it + 1;

      sub_num2(1:dim_num) = iwork2(it) * sub_num2(1:dim_num);

      continue

    end
%
%  Compute the difference table for Richardson extrapolation.
% 
    for ll = 2 : it
      i = it + 1 - ll;
      factor = ( iwork2(i)^2 ) / ( iwork2(it)^2 - iwork2(i)^2 );
      table(i) = table(i+1) + ( table(i+1) - table(i) ) * factor;
    end
 
    result = table(1);
%
%  Terminate successfully if the estimated error is acceptable.
%
    if ( abs ( result - result_old ) <= abs ( result * ( tol + rnderr ) ) )
      ind = 1;
      break
    end
%
%  Terminate unsuccessfully if the iteration limit has been reached.
%
    if ( it_max <= it )
      ind = -1;
      break
    end
%
%  Prepare for another step.
%
    result_old = result;

    it = it + 1;

    iwork2(it) = round ( 1.5 * iwork2(it-1) );

    sub_num2(1:dim_num) = round ( 1.5 * sub_num2(1:dim_num) );
 
  end

  return
end
