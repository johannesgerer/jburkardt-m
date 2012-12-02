function c = correlation_spherical ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_SPHERICAL evaluates the spherical correlation function.
%
%  Discussion:
%
%    This correlation is based on the volume of overlap of two spheres
%    of radius RHO0 and separation RHO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Petter Abrahamsen,
%    A Review of Gaussian Random Fields and Correlation Functions,
%    Norwegian Computing Center, 1997.
%
%  Parameters:
%
%    Input, integer N, the number of arguments.
%
%    Input, real RHO(N,1), the arguments.
%
%    Input, real RHO0, the correlation length.
%
%    Output, real C(N,1), the correlations.
%
  rho = rho ( : );

  rhohat = min ( abs ( rho ) / rho0, 1.0 );

  c = 1.0 - 1.5 * rhohat + 0.5 * rhohat.^3;

  return
end


  
