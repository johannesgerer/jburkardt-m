function [ alpha1, alpha2, beta, beta1, beta2, czero, difeta, etazero, fzero, ...
  gamma1, gamma2, kappa, lambda1, lambda2, m, nu1, nu2, vzero, xl, xr ] = ...
  bio_constants ( )

%*****************************************************************************80
%
%% BIO_CONSTANTS sets biological constants.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2005
%
%  Parameters:
%
%    Output, real XL, XR, the left and right endpoints of the region.
%

%
%  The extent of the domain.
%
  xl = 0.0;
  xr = 1.0;
%
%  The initial conditions.
%
  vzero = 15.0;
  kappa = 0.00554245;
  m = 10;
  czero = 0.0;
  fzero = 1.0;
  etazero = 1.0;
%
%  Parameters occurring in equations.
%
  lambda1 = 73.0;
  lambda2 = 19.0;
  nu1 = 0.007;
  nu2 = 1.28;
  difeta = 0.0144;
  beta = 0.222;
%
%  Parameters for calculation of TAU.
%
  alpha1 = 0.001;
  alpha2 = 1.0;
  beta1 = 1.0;
  beta2 = 0.001;
  gamma1 = 1.2;
  gamma2 = 1.2; 

  return
end
