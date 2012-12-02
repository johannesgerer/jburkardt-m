function g = p23_g ( n, x )

%*****************************************************************************80
%
%% P23_G evaluates the gradient for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2000
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

  g(1) = 400.0 * ( x(1) * x(1) - x(2) ) * x(1) - 2.0 + 2.0 * x(1);
  g(2) = - 200.0 * ( x(1) * x(1) - x(2) );

  return
end
