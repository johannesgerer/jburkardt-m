function g = p43_g ( n, x )

%*****************************************************************************80
%
%% P43_G evaluates the gradient for problem 43.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
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

  g(1) = 4.0 * ( x(1)^2 + x(2) - 11.0 ) * x(1) ...
       + 2.0 * ( x(1) + x(2)^2 - 7.0 );

  g(2) = 2.0 * ( x(1)^2 + x(2) - 11.0 ) ...
       + 4.0 * ( x(1) + x(2)^2 - 7.0 ) * x(2);

  return
end
