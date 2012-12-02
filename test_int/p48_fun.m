function fx = p48_fun ( n, x )

%*****************************************************************************80
%
%% P48_FUN evaluates the integrand for problem 48.
%
%  Discussion:
%
%    The function is singular at the left endpoint.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ln ( x ) / sqrt ( x )
%
%  Exact Integral:
%
%    -4
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
%    Springer, 1983, page 103.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = log ( x(1:n) ) ./ sqrt ( x(1:n) );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
