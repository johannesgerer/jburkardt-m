function jed = mayan_round_to_jed ( y, a, b, c, d, f )

%*****************************************************************************80
%
%% MAYAN_ROUND_TO_JED converts a Mayan round date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm L,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 341.
%
%  Parameters:
%
%    Input, integer Y, A, B, C, D, values defining the Mayan
%    round date.
%
%    Input, real F, the fractional part of the date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  m = 13 * i4_modp ( 60 + 3 * ( a - b ), 20 ) + a - 1;
  m = i4_modp ( m + 101, 260 );
  n = 20 * d + c;
  n = i4_modp ( n + 17, 365 );
  r = 365 * i4_modp ( 364 + m - n, 52 ) + n;

  jed_epoch = epoch_to_jed_mayan_long ( );
  jed = jed_epoch + 18980 * y + r + f;

  return
end
