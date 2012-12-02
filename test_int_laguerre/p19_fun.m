function fx = p19_fun ( n, x )

%*****************************************************************************80
%
%% P19_FUN evaluates the integrand for problem 19.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) x^(beta-1) / ( 1 + 10 x )^2 dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Piessens, Elise de Doncker-Kapenga,
%    Christian Ueberhuber, David Kahaner,
%    QUADPACK: A Subroutine Package for Automatic Integration,
%    Springer, 1983, page 84.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the point at which the integrand
%    is to be evaluated.
%
%    Output, real FX(N), the value of the integrand at X.
%
  beta = 0.5;

  fx(1:n) = x(1:n).^( beta - 1.0 ) ./ ( 1.0 + 10.0 * x(1:n) ).^2;

  if ( beta < 1.0 )
    i = find ( x == 0.0 );
    fx(i) = 0.0;
  end

  return
end
