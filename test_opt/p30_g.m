function g = p30_g ( n, x )

%*****************************************************************************80
%
%% P30_G evaluates the gradient for problem 30.
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
  g = zeros ( n, 1 );

  a = 1.0;
  d = 6.0;
  e = 10.0;

  b = 5.1 / ( 4.0 * pi^2 );;
  c = 5.0 / pi;
  ff = 1.0 / ( 8.0 * pi );

  g(1) = 2.0 * a * ( x(2) - b * x(1)^2 + c * x(1) - d ) ...
    * ( - 2.0 * b * x(1) + c ) - e * ( 1.0 - ff ) * sin ( x(1) );

  g(2) = 2.0 * a * ( x(2) - b * x(1)^2 + c * x(1) - d );

  return
end
