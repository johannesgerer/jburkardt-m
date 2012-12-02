function [ pictun, baktun, katun, tun, uinal, kin, f ] = jed_to_mayan_long ...
  ( jed )

%*****************************************************************************80
%
%% JED_TO_MAYAN_LONG converts a JED to a Mayan long count date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, chapter 27.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer PICTUN, BAKTUN, KATUN, TUN, UINAL, KIN, values
%    defining the Mayan long date.
%
%    Output, real F, the fractional part of the date.
%
  jed_epoch = epoch_to_jed_mayan_long ( );

  j = floor ( jed - jed_epoch );
  f = jed - jed_epoch - j;

  days = j;

  if ( 0 <= days )

    pictun = floor ( days / 2880000 );
    days = days - pictun * 2880000;

  else

    pictun = 0;
    while ( days < 0 )
      pictun = pictun - 1;
      days = days + 2880000;
    end

  end

  baktun = floor ( days / 144000 );
  days = days - baktun * 144000;
  katun = floor ( days / 7200 );
  days = days - katun * 7200;
  tun = floor ( days / 360 );
  days = days - tun * 360;
  uinal = floor ( days / 20 );
  days = days - uinal * 20;
  kin = days;

  return
end
