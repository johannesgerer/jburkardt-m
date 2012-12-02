function g = p41_g ( n, x )

%*****************************************************************************80
%
%% P41_G evaluates the gradient for problem 41.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
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
  g = zeros ( 3, 1 );

  g(1) = 400.0 * x(1)^3 - 400.0 * x(2) * x(1) ...
    + 2.0 * x(1) - 2.0;

  g(2) = -200.0 * x(1)^2 + 220.2 * x(2) + 19.8 * x(4) - 40.0;

  g(3) = -360.0 * x(3) * x(4) + 360.0 * x(3)^3 ...
    + 2.0 * x(3) - 2.0;

  g(4) = + 180.0 * x(4) - 180.0 * x(3)^2 + 20.2 * x(4) ...
    + 19.8 * x(2) - 40.0;

  return
end
