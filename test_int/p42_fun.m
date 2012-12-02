function fx = p42_fun ( n, x )

%*****************************************************************************80
%
%% P42_FUN evaluates the integrand for problem 42.
%
%  Discussion:
%
%    The problem has a parameter ALPHA that can be set by calling
%    P42_PARAM_SET.
%
%    The integrand has a singularity at X = 0 if ALPHA < 1.
%
%    The suggested range for ALPHA is 0.1 through 2.
%
%  Interval:
%
%    0 <= x <= pi/2
%
%  Integrand:
%
%    ( sin(x) )^( alpha - 1 )
%
%  Exact Integral:
%
%    2^( alpha - 2 ) * ( Gamma(alpha/2) )^2 / Gamma(alpha)
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
  alpha = p42_param_get ( );

  fx = sin ( x ).^( alpha - 1.0 );

  if ( alpha < 1.0 )
    i = find ( x == 0.0 );
    fx(i) = 0.0;
  end

  return
end
