function c = correlation_pentaspherical ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_PENTASPHERICAL evaluates the pentaspherical correlation function.
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

  c = 1.0 - 1.875 * rhohat + 1.25 * rhohat.^3 - 0.375 * rhohat.^5;

  return
end


  
