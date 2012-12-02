function exact = p13_exact ( )

%*****************************************************************************80
%
%% P13_EXACT returns the estimated integral for problem 13.
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
  [ a, b ] = p13_lim ( );

  exact = r8_si ( b ) - r8_si ( a );

  return
end
