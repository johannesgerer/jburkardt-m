function [ fx, fy ] = f01_f1 ( n, x, y )

%*****************************************************************************80
%
%% F01_F1 returns first derivatives of function 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), Y(N,1), the evalution points.
%
%    Output, real FX(N,1), FY(N,1), the derivative values.
%
  t1(1:n,1) = exp ( - ( ( 9.0 * x(1:n,1) - 2.0 ).^2 ...
                    + ( 9.0 * y(1:n,1) - 2.0 ).^2 ) / 4.0 );
  t2(1:n,1) = exp ( - ( ( 9.0 * x(1:n,1) + 1.0 ).^2 ) / 49.0 ...
                    - ( 9.0 * y(1:n,1) + 1.0 ) / 10.0 );
  t3(1:n,1) = exp ( - ( ( 9.0 * x(1:n,1) - 7.0 ).^2 ...
                    + ( 9.0 * y(1:n,1) - 3.0 ).^2 ) / 4.0 );
  t4(1:n,1) = exp ( -   ( 9.0 * x(1:n,1) - 4.0 ).^2 ...
                    - ( 9.0 * y(1:n,1) - 7.0 ).^2 );

  fx(1:n,1) = ...
    - 3.375           * ( 9.0 * x(1:n,1) - 2.0 ) * t1 ...
    - ( 27.0 / 98.0 ) * ( 9.0 * x(1:n,1) + 1.0 ) * t2 ...
    - 2.25            * ( 9.0 * x(1:n,1) - 7.0 ) * t3 ...
    + 3.6             * ( 9.0 * x(1:n,1) - 4.0 ) * t4;

  fy(1:n,1) = ...
    - 3.375 * ( 9.0 * y(1:n,1) - 2.0 ) * t1 ...
    - 0.675                          * t2 ...
    - 2.25  * ( 9.0 * y(1:n,1) - 3.0 ) * t3 ...
    + 3.6   * ( 9.0 * y(1:n,1) - 7.0 ) * t4;

  return
end
