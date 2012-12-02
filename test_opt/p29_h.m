function h = p29_h ( n, x )

%*****************************************************************************80
%
%% P29_H evaluates the Hessian for problem 29.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2001
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

  a = x(1) + x(2) + 1.0;

  b = 19.0 - 14.0 * x(1) + 3.0 * x(1)^2 - 14.0 * x(2) ...
    + 6.0 * x(1) * x(2) + 3.0 * x(2)^2;

  e = - 14.0 + 6.0 * x(1) + 6.0 * x(2);

  c = 2.0 * x(1) - 3.0 * x(2);

  d = 18.0 - 32.0 * x(1) + 12.0 * x(1)^2 + 48.0 * x(2) ...
    - 36.0 * x(1) * x(2) + 27.0 * x(2)^2;

  r = - 32.0 + 24.0 * x(1) - 36.0 * x(2);
  s = 48.0 - 36.0 * x(1) + 54.0 * x(2);

  h(1,1) = 2.0 * ( 2.0 * a * b + a^2 * e ) ...
    * ( 4.0 * c * d + c^2 * r ) + ( 1.0 + a^2 * b ) ...
    * ( 8.0 * d + 4.0 * c * r + 4.0 * c * r + 24.0 * c^2 ) ...
    + ( 2.0 * b + 2.0 * a * e + 2.0 * a * e + 6.0 * a^2 ) ...
    * ( 30.0 + c^2 * d );

  h(1,2) = ( 2.0 * a * b + a^2 * e ) ...
    * ( -2.0 * c * d + c^2 * ( r + s ) ) ...
    + ( 1.0 + a^2 * b ) ...
    * ( -12.0 * d + 4.0 * c * s -6.0 * c * r - 36.0 * c^2 ) ...
    + ( 2.0 * b + 4.0 * a * e + 6.0 * a^2 ) ...
    * ( 30.0 + c^2 * d );

  h(2,1) = ( 2.0 * a * b + a^2 * e ) ...
    * ( -2.0 * c * d + c^2 * ( s + r ) ) ...
    + ( 1.0 + a^2 * b ) ...
    * ( -12.0 * d - 6.0 * c * r + 4.0 * c * s - 36.0 * c^2 ) ...
    + ( 2.0 * b + 4.0 * a * e + 6.0 * a^2 ) ...
    * ( 30.0 + c^2 * d );

  h(2,2) = 2.0 * ( 2.0 * a * b + a^2 * e ) ...
    * ( -6.0 * c * d + c^2 * s ) ...
    + ( 1.0 + a^2 * b ) ...
    * ( 18.0 * d - 6.0 * c * s - 6.0 * c * s + 54.0 * c^2 ) ...
    + ( 2.0 * b + 2.0 * a * e + 2.0 * a * e + 6.0 * a^2 ) ...
    * ( 30.0 + c^2 * d );

  return
end
