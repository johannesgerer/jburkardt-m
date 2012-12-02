function [ result, eval_num ] = p5_nd ( func, dim_num, a, b )

%*****************************************************************************80
%
%% P5_ND estimates a multidimensional integral using a formula of exactness 5.
%
%  Discussion:
%
%    The routine uses a method which is exact for polynomials of total 
%    degree 5 or less.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real A(DIM_NUM), B(DIM_NUM), the integration limits.
%
%    Output, real RESULT, the approximate value of the integral.
%
%    Output, integer EVAL_NUM, the number of function evaluations.
%
  eval_num = 0;

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P5_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1, DIM_NUM = %d\n', dim_num );
    error ( '  P5_ND - Fatal error!' );
  end
 
  a2 = 25.0 / 324.0;
  a3 = sqrt ( 0.6 );
  a0 = ( 25.0 * dim_num * dim_num - 115.0 * dim_num + 162.0 ) / 162.0;
  a1 = ( 70.0 - 25.0 * dim_num ) / 162.0;
 
  volume = prod ( b(1:dim_num) - a(1:dim_num) );
  work(1:dim_num) = 0.5 * ( a(1:dim_num) + b(1:dim_num) );
 
  result = 0.0;
  if ( volume == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P5_ND - Warning!\n' );
    fprintf ( 1, '  Volume = 0, integral = 0.\n' );
    return
  end
 
  sum1 = a0 * feval ( func, dim_num, work );
  eval_num = eval_num + 1;

  sum2 = 0.0;
  sum3 = 0.0;
 
  for i = 1 : dim_num

    work(i) = 0.5 * ( ( a(i) + b(i) ) + a3 * ( b(i) - a(i) ) );
    sum2 = sum2 + feval ( func, dim_num, work );
    eval_num = eval_num + 1;

    work(i) = 0.5 * ( ( a(i) + b(i) ) - a3 * ( b(i) - a(i) ) );
    sum2 = sum2 + feval ( func, dim_num, work );
    eval_num = eval_num + 1;

    work(i) = 0.5 * ( a(i) + b(i) );

  end
 
  if ( 1 < dim_num )
 
    a4 = a3;
 
    while ( 1 )
 
      for i = 1 : dim_num - 1
 
        work(i) = 0.5 * ( ( a(i) + b(i) ) + a4 * ( b(i) - a(i) ) );
        a5 = a3;
 
        while ( 1 )
 
          for j = i + 1 : dim_num
            work(j) = 0.5 * ( ( a(j) + b(j) ) + a5 * ( b(j) - a(j) ) );
            sum3 = sum3 + feval ( func, dim_num, work );
            eval_num = eval_num + 1;
            work(j) = 0.5 * ( a(j) + b(j) );
          end
 
          a5 = -a5;

          if ( 0.0 <= a5 )
            break
          end

        end
 
        work(i) = 0.5 * ( a(i) + b(i) );
 
      end
 
      a4 = -a4;

      if ( 0.0 <= a4 )
        break
      end

    end
 
  end
 
  result = volume * ( sum1 + a1 * sum2 + a2 * sum3 );
 
  return
end
