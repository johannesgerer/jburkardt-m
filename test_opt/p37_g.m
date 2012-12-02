function g = p37_g ( n, x )

%*****************************************************************************80
%
%% P37_G evaluates the gradient for problem 37.
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
  arg = - ( x(1) - pi )^2 - ( x(2) - pi )^2;

  g = zeros ( n, 1 );

  g(1) = ( sin ( x(1) ) * cos ( x(2) ) ...
       + 2.0 * cos ( x(1) ) * cos ( x(2) ) * ( x(1) - pi ) ) ...
       * exp ( arg );

  g(2) = ( cos ( x(1) ) * sin ( x(2) ) ...
       + 2.0 * cos ( x(1) ) * cos ( x(2) ) * ( x(2) - pi ) ) ...
       * exp ( arg );

  return
end
