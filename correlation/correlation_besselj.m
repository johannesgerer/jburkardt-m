function c = correlation_besselj ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_BESSELJ evaluates the Bessel J correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2012
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

  rhohat = abs ( rho ) / rho0;

  c = besselj ( 0, rhohat );

  return
end


  
