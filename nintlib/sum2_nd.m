function [ result, eval_num ] = sum2_nd ( func, xtab, weight, order, dim_num )

%*****************************************************************************80
%
%% SUM2_ND estimates a multidimensional integral using a product rule.
%
%  Discussion:
%
%    The routine uses a product rule supplied by the user.
%
%    The region may be a product of any combination of finite,
%    semi-infinite, or infinite intervals.
%
%    For each factor in the region, it is assumed that an integration
%    rule is given, and hence, the region is defined implicitly by
%    the integration rule chosen.
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
%    MATLAB version by John Burkardt
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
%    Input, real XTAB(DIM_NUM,ORDER_MAX).  XTAB(I,J) is the I-th coordinate
%    of the abscissa for the J-th rule.
%
%    Input, real WEIGHT(DIM_NUM,ORDER_MAX).  WEIGHT(I,J) is the I-th
%    weight for the J-th rule.
%
%    Input, integer ORDER(DIM_NUM). ORDER(I) is the number of
%    abscissas to be used in the J-th rule. ORDER(I) must be
%    greater than 0 and less than or equal to ORDER_MAX.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real RESULT, the approximate value of the integral.
%
%    Output, integer EVAL_NUM, the number of function evaluations.
%

%
%  Default values.
%
  result = 0.0;
  eval_num = 0;

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUM2_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1\n' );
    fprintf ( 1, '  DIM_NUM = %d', dim_num );
    error ( 'SUM2_ND - Fatal error!' );
  end
 
  for i = 1 : dim_num

    if ( order(i) < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SUM2_ND - Fatal error!\n' );
      fprintf ( 1, '  ORDER(I) < 1.\n' );
      fprintf ( 1, '  For I = %d\n', i );
      fprintf ( 1, '  ORDER(I) = %d\n', order(i) );
      error ( 'SUM2_ND - Fatal error!' );
    end

  end
 
  iwork(1:dim_num) = 1;
 
  while ( 1 )
 
    k = 1;
 
    w1 = 1.0;
    for i = 1 : dim_num
      m1 = iwork(i);
      work(i) = xtab(i,m1);
      w1 = w1 * weight(i,m1);
    end

    result = result + w1 * feval ( func, dim_num, work );
    eval_num = eval_num + 1;

    while ( iwork(k) == order(k) )

      iwork(k) = 1;
      k = k + 1;

      if ( dim_num < k )
        return
      end

    end
 
    iwork(k) = iwork(k) + 1;

  end

  return
end
