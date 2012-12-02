function exact = p25_exact ( )

%*****************************************************************************80
%
%% P25_EXACT returns the estimated integral for problem 25.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the estimated value of the integral.
%
  exact = 0.3 * log ( 0.3 ) + 0.7 * log ( 0.7 ) - 1.0;

  return
end
