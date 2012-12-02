function g = p29_g ( n, x )

%*****************************************************************************80
%
%% P29_G evaluates the gradient for problem 29.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2001
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
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  a = x(1) + x(2) + 1.0;

  b = 19.0 - 14.0 * x(1) + 3.0 * x(1)^2 - 14.0 * x(2) ...
    + 6.0 * x(1) * x(2) + 3.0 * x(2)^2;

  dbdx1 = - 14.0 + 6.0 * x(1) + 6.0 * x(2);
  dbdx2 = - 14.0 + 6.0 * x(1) + 6.0 * x(2);

  c = 2.0 * x(1) - 3.0 * x(2);

  d = 18.0 - 32.0 * x(1) + 12.0 * x(1)^2 + 48.0 * x(2) ...
    - 36.0 * x(1) * x(2) + 27.0 * x(2)^2;
  dddx1 = - 32.0 + 24.0 * x(1) - 36.0 * x(2);
  dddx2 = 48.0 - 36.0 * x(1) + 54.0 * x(2);

  g(1) = ( 1.0 + a^2 * b ) * ( 4.0 * c * d + c^2 * dddx1 ) ...
        + ( 2.0 * a * b + a^2 * dbdx1 ) * ( 30.0 + c^2 * d );

  g(2) = ( 1.0 + a^2 * b ) * ( -6.0 * c * d + c^2 * dddx2 ) ...
        + ( 2.0 * a * b + a^2 * dbdx2 ) * ( 30.0 + c^2 * d );

  return
end
