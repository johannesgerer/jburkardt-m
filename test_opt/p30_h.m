function h = p30_h ( n, x )

%*****************************************************************************80
%
%% P30_H evaluates the Hessian for problem 30.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  a = 1.0;
  d = 6.0;
  e = 10.0;

  b = 5.1 / ( 4.0 * pi^2 );
  c = 5.0 / pi;
  ff = 1.0 / ( 8.0 * pi );

  h(1,1) = 2.0 * a * ( - 2.0 * b * x(1) + c ) ...
    * ( - 2.0 * b * x(1) + c ) ...
    - 4.0 * a * b * ( x(2) - b * x(1)^2 + c * x(1) - d ) ...
    - e * ( 1.0 - ff ) * cos ( x(1) );

  h(1,2) = 2.0 * a * ( - 2.0 * b * x(1) + c );

  h(2,1) = 2.0 * a * ( - 2.0 * b * x(1) + c );
  h(2,2) = 2.0 * a;

  return
end
