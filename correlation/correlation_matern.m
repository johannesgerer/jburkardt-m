function c = correlation_matern ( n, rho, rho0, nu )

%*****************************************************************************80
%
%% CORRELATION_MATERN evaluates the Matern correlation function.
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
%    Input, integer N, the number of arguments.
%
%    Input, real RHO(N,1), the arguments.
%    0.0 <= RHO.
%
%    Input, real RHO0, the correlation length.
%    0.0 < RHO0.
%
%    Input, real NU, the smoothness parameter.
%    NU has a default value of 2.5;
%    0 < NU.
%
%    Output, real C(N,1), the correlations.
%
  if ( nargin < 4 )
    nu = 2.5;
  end

  rho1 = 2.0 * sqrt ( nu ) * abs ( rho ( : ) ) / rho0;
  
  i = find ( rho1 == 0 );
  
  c = ( rho1 ) .^ nu .* besselk ( nu, rho1 ) / gamma ( nu ) / 2.0 ^ ( nu - 1 );

  c(i) = 1.0;

  return
end


  
