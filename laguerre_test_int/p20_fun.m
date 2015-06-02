function fx = p20_fun ( n, x )

%*****************************************************************************80
%
%% P20_FUN evaluates the integrand for problem 20.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) 
%      1 / ( 2^beta * ( ( x - 1 )^2 + (1/4)^beta ) * ( x - 2 ) ) dx
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

  fx(1:n) = ( 2.0^beta * ( ( x(1:n) - 1.0 ).^2 + 0.25^beta ) .* ( x(1:n) - 2.0 ) );
  i = find ( fx == 0.0 );  
  fx = 1.0 ./ fx;
  fx(i) = 0.0;

  return
end
