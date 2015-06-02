function c = matern_correlation ( s, t )

%*****************************************************************************80
%
%% MATERN_CORRELATION evaluates the Matern correlation function.
%
%  Discussion:
%
%    The Matern correlation is
%
%      rho1 = 2 * sqrt ( nu ) * rho / rho0
%
%      c(rho) = ( rho1 )^nu * BesselK ( nu, rho1 ) / gamma ( nu ) / 2 ^ ( nu - 1 )
%
%    The Matern covariance has the form:
%
%      K(rho) = sigma^2 * c(rho)
%
%    A Gaussian process with Matern covariance has sample paths that are
%    differentiable (nu - 1) times.
%
%    When nu = 0.5, the Matern covariance is the exponential covariance.
%
%    As nu goes to infinity, the correlation converges to exp ( - (rho/rho0)^2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S(N), T(N), two sequences of data.
%
%    Input, real NU, the smoothness parameter.
%    NU has a default value of 2.5;
%    0 < NU.
%
%    Output, real C(N,1), the correlations.
%
  n = length ( s );
  c = zeros ( n, 1 );

  if ( nargin < 3 )
    nu = 2.5;
  end

  rho1 = 2.0 * sqrt ( nu ) * abs ( s - t );
  
  i = find ( rho1 == 0 );
  
  c = ( rho1 ) .^ nu .* besselk ( nu, rho1 ) / gamma ( nu ) / 2.0 ^ ( nu - 1 );

  c(i) = 1.0;

  return
end
  
