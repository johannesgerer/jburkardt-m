function jed = mayan_long_to_jed ( pictun, baktun, katun, tun, uinal, kin, f )

%*****************************************************************************80
%
%% MAYAN_LONG_TO_JED converts a Mayan long date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2010
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
%    Input, integer PICTUN, BAKTUN, KATUN, TUN, UINAL, KIN, values
%    defining the Mayan long date.
%
%    Input, real F, the fractional part of the date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  days = (((((   pictun   * 20 + baktun ) * 20 + katun  ) * 20 ...
    + tun    ) * 18 + uinal  ) * 20 + kin );

  jed_epoch = epoch_to_jed_mayan_long ( );

  jed = jed_epoch + days + f;

  return
end
