function c = correlation_hole ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_HOLE evaluates the hole correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2012
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
%
%    Input, real RHO0, the correlation length.
%
%    Output, real C(N,1), the correlations.
%
  rho = rho ( : );

  rhohat = abs ( rho ) / rho0;

  c = ( 1.0 - rhohat ) .* exp ( - rhohat );

  return
end


  
