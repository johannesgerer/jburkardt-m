function [ m, d ] = easter_julian ( y )

%*****************************************************************************80
%
%% EASTER_JULIAN computes the date of Easter in the Julian calendar.
%
%  Discussion:
%
%    This computation for the date of Easter uses the Dionysian
%    canon that applied to the Julian calendar.  The determination
%    of the date of Easter changed at the same time that the calendar
%    was modified to use the Gregorian system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm M,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 365.
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of the Julian
%    calendar on which Easter occurs.
%
  if ( y <= 0 )
    m = -1;
    d = -1;
    return
  end

  p = y + floor ( y / 4 ) + 4;
  n = 7 - mod ( p, 7 );

  e = year_to_epact_julian ( y );

  r = 22 + mod ( 53 - e, 30 );

  c = i4_wrap ( r + 3, 1, 7 );

  s = r + mod ( 7 + n - c, 7 );

  m = 3 + floor ( s / 32 );
%
%  Use wrapping so that 1 <= D <= 31.
%
  d = i4_wrap ( s, 1, 31 );

  return
end
