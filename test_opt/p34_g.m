function g = p34_g ( n, x )

%*****************************************************************************80
%
%% P34_G evaluates the gradient for problem 34.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2001
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

  g(1) = 8.0 * x(1) - 8.4 * x(1)^3 + 2.0 * x(1)^5 + x(2);
  g(2) = x(1) - 8.0 * x(2) + 16.0 * x(2)^3;

  return
end
