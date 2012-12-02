function c = correlation_damped_sine ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_DAMPED_SINE evaluates the damped sine correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2012
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

  c = ones ( size ( rho ) );

  rhohat = rho / rho0;
  i = find ( rhohat ~= 0 );
  c(i) = sin ( rhohat(i) ) ./ rhohat(i);

  return
end


  
