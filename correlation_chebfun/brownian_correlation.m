function K = correlation_brownian ( s, t )

%*****************************************************************************80
%
%% CORRELATION_BROWNIAN computes the Brownian correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S(*), T(*), pairs of argument values.
%
%    Output, real K(*), the correlation function values
%
  K = ones ( size ( s ) );
  i = find ( max ( s, t ) ~= 0.0 );
  K(i) = sqrt ( min ( s(i), t(i) ) ./ max ( s(i), t(i) ) );
  
  return
end
