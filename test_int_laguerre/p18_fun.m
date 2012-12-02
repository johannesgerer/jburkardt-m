function fx = p18_fun ( n, x )

%*****************************************************************************80
%
%% P18_FUN evaluates the integrand for problem 18.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) x^2 * exp ( - x / 2^beta ) dx
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
  beta = 1.0;

  fx(1:n) = x(1:n).^2 .* exp ( - x(1:n) / 2^beta );

  return
end
