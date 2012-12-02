function fx = p49_fun ( n, x )

%*****************************************************************************80
%
%% P49_FUN evaluates the integrand for problem 49.
%
%  Discussion:
%
%    The function is singular at two internal points, 1 and sqrt(2).
%
%  Interval:
%
%    0 <= x <= 3
%
%  Integrand:
%
%    x^3 * log ( abs ( ( x^2 - 1 ) * ( x^2 - 2 ) ) )
%
%  Exact Integral:
%
%    61 log ( 2 ) + (77/4) log ( 7 ) - 27 = 52.7408...
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
%    Springer, 1983, page 104.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  x = x ( : );

  fx(1:n,1) = abs ( ( x(1:n,1).^2 - 1.0 ) .* ( x(1:n,1).^2 - 2.0 ) );
  i = ( fx == 0.0 );
  fx = x.^3 .* log ( fx );
  fx(i) = 0.0;

  return
end
