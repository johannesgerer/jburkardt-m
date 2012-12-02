function fx = p17_fun ( n, x )

%*****************************************************************************80
%
%% P17_FUN evaluates the integrand for problem 17.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) exp ( - x / 2^beta ) * cos ( x ) / sqrt ( x ) dx
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
  beta = 2.0;

  fx(1:n) = exp ( - x(1:n) / 2.0^beta ) .* cos ( x(1:n) ) ./ sqrt ( x(1:n) );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
