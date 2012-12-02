function g = p12_g ( n, x )

%*****************************************************************************80
%
%% P12_G evaluates the gradient for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2000
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

  for i = 1 : 99

    arg = i / 100.0;
    r = abs ( ( - 50.0 * log ( arg ) )^( 2.0 / 3.0 ) + 25.0 - x(2) );
    t1 = r^x(3) / x(1);
    t2 = exp ( - t1 );

    t = exp ( - r^x(3) / x(1) ) - arg;

    g(1) = g(1) + 2.0 * t * t1 * t2 / x(1);
    g(2) = g(2) + 2.0 * t * t1 * t2 * x(3) / r;
    g(3) = g(3) - 2.0 * t * t1 * t2 * log ( r );

  end

  return
end
