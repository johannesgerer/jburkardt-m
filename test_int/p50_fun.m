function fx = p50_fun ( n, x )

%*****************************************************************************80
%
%% P50_FUN evaluates the integrand for problem 50.
%
%  Discussion:
%
%    The function has a removable singularity at x = 0.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    log ( x ) * sin ( 10 * pi * x )
%
%  Exact Integral:
%
%    ( - gamma - log ( 10 * pi ) + Ci ( 10 * pi ) ) / 10 * pi = -0.1281316...
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
%      Christian Ueberhuber, David Kahaner,
%    QUADPACK: A Subroutine Package for Automatic Integration,
%    Springer, 1983, page 106.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = log ( x(1:n) ) .* sin ( 10.0 * pi * x(1:n) );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
