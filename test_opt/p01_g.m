function g = p01_g ( n, x )

%*****************************************************************************80
%
%% P01_G evaluates the gradient for problem 1.
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

  th = p01_th ( x );

  r = sqrt ( x(1) * x(1) + x(2) * x(2) );
  t = x(3) - 10.0 * th;
  s1 = 5.0 * t / ( pi * r * r );

  g(1) = 200.0 * ( x(1) - x(1) / r + x(2) * s1 );
  g(2) = 200.0 * ( x(2) - x(2) / r - x(1) * s1 );
  g(3) = 2.0 * ( 100.0 * t + x(3) );

  return
end
