function [ n1, n2 ] = year_to_dominical_julian ( y )

%*****************************************************************************80
%
%% YEAR_TO_DOMINICAL_JULIAN: dominical numbers, Julian calendar.
%
%  Discussion:
%
%    The days of each year are numbered with "calendar letters", with
%    January 1 having letter 'A', January 7 having letter 'G', and
%    the cycle then repeating with January 8 having letter 'A'.
%
%    This cycle is independent of the weekday cycle.  If a year is
%    not a leap year, then all Sundays have the same calendar letter.
%    This is called the dominical letter of the year.  If a year is
%    a leap year, then all Sundays before March 1 have one calendar
%    letter, and all Sundays after have another (namely, the calendar
%    letter one position earlier in the cycle).
%
%    Using the correspondence A = 1, B = 2, ..., we may speak of
%    the dominical number of a year, or dominical numbers for a leap year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.  The year 0 is illegal input.
%
%    Output, integer N1, N2, the dominical numbers for the year.
%    If Y is a leap year, then N1 applies before March 1, and N2 after.
%    If Y is not a leap year, then N1 applies throughout the year,
%    and N2 is returned as N1.
%
  if ( y == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_TO_DOMINICAL_JULIAN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input Y = 0.\n' );
    error ( 'YEAR_TO_DOMINICAL_JULIAN - Fatal error!' );
  end

  y2 = y_common_to_astronomical ( y );

  p1 = y2 + floor ( y2 / 4 ) + 4;
  n1 = 7 - i4_modp ( p1, 7 );

  if ( year_is_leap_julian ( y2 ) )
    n2 = n1;
    p1 = p1 - 1;
    n1 = 7 - i4_modp ( p1, 7 );
  else
    n2 = n1;
  end

  return
end
