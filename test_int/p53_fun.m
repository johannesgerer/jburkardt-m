function fx = p53_fun ( n, x )

%*****************************************************************************80
%
%% P53_FUN evaluates the integrand for problem 53.
%
%  Discussion:
%
%    The integrand is singular at x = -1 + sqrt ( 3 ) = 0.732...
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    1 / sqrt ( abs ( x^2 + 2 * x - 2 ) )
%
%  Exact Integral:
%
%    pi / 2 - arctan ( 1 / sqrt ( 2 ) ) + ln ( 3 ) / 2 = 1.504622...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Piessens, Elise de Doncker-Kapenga,
%      Christian Ueberhuber, David Kahaner,
%    QUADPACK: A Subroutine Package for Automatic Integration,
%    Springer, 1983, page 110.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = 1.0 ./ sqrt ( abs ( x(1:n).^2 + 2.0 * x(1:n) - 2.0 ) );

  return
end
