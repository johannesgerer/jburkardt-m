function [ y, a, b, c, d, f ] = jed_to_mayan_round ( jed )

%*****************************************************************************80
%
%% JED_TO_MAYAN_ROUND converts a JED to a Mayan round date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm K,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 340.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, A, B, C, D, values defining the Mayan
%    round date.
%
%    Output, real F, the fractional part of the date.
%
  jed_epoch = epoch_to_jed_mayan_long ( );

  j = floor ( jed - jed_epoch );
  f = jed - jed_epoch - j;

  days = j;

  y = 0;

  while ( days < 0 )
    days = days + 18980;
    y = y - 1;
  end

  y = y + floor ( days / 18980 );

  days = mod ( days, 18980 );

  a = i4_wrap ( days + 4, 1, 13 );
  b = i4_wrap ( days, 1, 20 );

  n = mod ( days + 348, 365 );
  c = mod ( n, 20 );
  d = floor ( n / 20 );

  return
end
