function [ m, d ] = easter_julian2 ( y )

%*****************************************************************************80
%
%% EASTER_JULIAN2 computes the date of Easter in the Julian calendar.
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
%    Algorithm N,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 365.
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of the Julian calendar
%    on which Easter occurs.
%
  if ( y <= 0 )
    m = -1;
    d = -1;
    return
  end

  a = year_to_golden_number ( y );
  a = a - 1;

  b = 22 + mod ( 225 - 11 * a, 30 );
  s = b + mod ( 56 + 6 * y - floor ( y / 4 ) - b, 7 );

  m = 3 + floor ( s / 32 );
%
%  Use wrapping to ensure that 1 <= D <= 31.
%
  d = i4_wrap ( s, 1, 31 );

  return
end
