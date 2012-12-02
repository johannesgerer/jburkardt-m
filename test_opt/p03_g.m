function g = p03_g ( n, x )

%*****************************************************************************80
%
%% P03_G evaluates the gradient for problem 3.
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
  y = p03_yvec ( );

  g = zeros ( n, 1 );

  for i = 1 : 15

    d1 = 0.5 * ( i - 1 );
    d2 = 3.5 - d1 - x(3);
    arg = - 0.5 * x(2) * d2 * d2;
    t = x(1) * exp ( arg ) - y(i);

    g(1) = g(1) + 2.0 * exp ( arg ) * t;
    g(2) = g(2) - x(1) * exp ( arg ) * t * d2 * d2;
    g(3) = g(3) + 2.0 * x(1) * x(2) * exp ( arg ) * t * d2;

  end

  return
end
