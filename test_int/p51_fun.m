function fx = p51_fun ( n, x )

%*****************************************************************************80
%
%% P51_FUN evaluates the integrand for problem 51.
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
%    ln ( x ) / ( 1 + ( ln(x) )^2 )^2
%
%  Exact Integral:
%
%    - ( ci(1) * sin(1) + ( pi/2 - si(1) ) * cos(1) ) / pi = - 0.1892752...
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
%    Springer, 1983, page 108.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = log ( x(1:n) ) ./ ( 1.0 + ( log ( x(1:n) ) ).^2 ).^2;

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
