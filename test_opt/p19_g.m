function g = p19_g ( n, x )

%*****************************************************************************80
%
%% P19_G evaluates the gradient for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2000
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

  g(1) = - 600.0 * ( x(2) - x(1)^3 ) * x(1) * x(1) - 2.0 * ( 1.0 - x(1) );

  g(2) = 200.0 * ( x(2) - x(1)^3 );

  return
end
