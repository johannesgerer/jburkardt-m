function g = p10_g ( n, x )

%*****************************************************************************80
%
%% P10_G evaluates the gradient for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
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

  g(1) = 2.0 * x(1) - 2000000.0 + 2.0 * x(1) * x(2) * x(2) - 4.0 * x(2);

  g(2) = 2.0 * x(2) - 0.000004 + 2.0 * x(1)^2 * x(2) - 4.0 * x(1);

  return
end
