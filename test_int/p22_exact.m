function exact = p22_exact ( )

%*****************************************************************************80
%
%% P22_EXACT returns the estimated integral for problem 22.
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
  exact = 0.125 * log ( 9.0 ) + pi / sqrt ( 48.0 );

  return
end
