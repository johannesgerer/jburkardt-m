function g = p38_g ( n, x )

%*****************************************************************************80
%
%% P38_G evaluates the gradient for problem 38.
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

  g(1) = 2.0 * x(1) + 0.9 * pi * sin ( 3.0 * pi * x(1) );
  g(2) = 4.0 * x(2) + 1.6 * pi * sin ( 4.0 * pi * x(2) );

  return
end
