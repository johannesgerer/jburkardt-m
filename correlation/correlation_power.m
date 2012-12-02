function c = correlation_power ( n, rho, rho0, e )

%*****************************************************************************80
%
%% CORRELATION_POWER evaluates the power correlation function.
%
%  Discussion:
%
%    The power correlation is
%
%      C(rho) = ( 1 - |rho| )^e  if 0 <= |rho| <= 1
%             = 0                otherwise
%
%      The constraint on the exponent is 2 <= e.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2012
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
%    Input, real E, the exponent.
%    E has a default value of 2;
%    2 <= E.
%
%    Output, real C(N,1), the correlations.
%
  if ( nargin < 4 )
    e = 2.0;
  end

  c = zeros ( n, 1 );

  rho1 = abs ( rho ( : ) ) / rho0;
  
  i = find ( rho1 <= 1 );
  
  c(i) = ( 1.0 - rho1(i) ) .^ e;

  return
end


  
