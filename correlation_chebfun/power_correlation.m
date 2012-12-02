function K = power_correlation ( s, t, e )

%*****************************************************************************80
%
%% POWER_CORRELATION evaluates the power correlation function.
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
  if ( nargin < 3 )
    e = 2.0;
  end

  rho1 = abs ( s - t );

  i = find ( rho1 <= 1.0 );

  K = zeros ( size ( rho1 ) );

  K(i) = ( 1.0 - rho1(i) ) .^ e;

  return
end
