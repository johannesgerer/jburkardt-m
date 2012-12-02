function fx = p41_fun ( n, x )

%*****************************************************************************80
%
%% P41_FUN evaluates the integrand for problem 41.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P41_PARAM_SET.
%
%    The integrand has a singularity at both endpoints, whose
%    severity increases with ALPHA.
%
%    The suggested range for ALPHA is 1 through 20.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    1 / ( sqrt ( 1 - x^2 ) * ( x + 1 + 2^(-alpha) ) )
%
%  Exact Integral:
%
%    pi / sqrt ( ( 1 + 2^(-alpha) ) - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2011
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
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  alpha = p41_param_get ( );

  fx = 1.0 ./ ( sqrt ( 1.0 - x.^2 ) .* ( x + 1.0 + 0.5^alpha ) );

  i = find ( x == 1.0 | x == -1.0 | x + 1.0 + 0.5^alpha == 0.0 );
  fx(i) = 0.0;

  return
end
