function c = correlation_cubic ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_CUBIC evaluates the cubic correlation function.
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

  c = 1.0 - 7.0 * rhohat.^2 + 8.75 * rhohat.^3 - 3.5 * rhohat.^5 + 0.75 * rhohat.^7;

  return
end


  
