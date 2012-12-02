function fx = p52_fun ( n, x )

%*****************************************************************************80
%
%% P52_FUN evaluates the integrand for problem 52.
%
%  Discussion:
%
%    The function has a singularity at x = 0.
%
%  Interval:
%
%    -1 <= x <= 5
%
%  Integrand:
%
%    1 / ( x * ( 5 * x^3 + 6 ) )
%
%  Exact Integral:
%
%    ln ( 125 / 631 ) / 18 = -0.08994401...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
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
%    Springer, 1983, page 109.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = x(1:n) .* ( 5.0 * x(1:n).^3 + 6.0 );
  i = ( fx == 0.0 );
  fx = 1.0 ./ fx;
  fx(i) = 0.0;

  return
end
