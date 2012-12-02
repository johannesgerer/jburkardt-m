function [ m, d ] = easter_knuth ( y )

%*****************************************************************************80
%
%% EASTER_KNUTH computes the month and day of Easter for a Gregorian year.
%
%  Discussion:
%
%    Knuth attributes the algorithm to Aloysius Lilius and Christopher Clavius
%    in the late 16th century.  The algorithm is for use with the Gregorian
%    calendar.
%
%  Example:
%
%    Input:
%
%      Y = 2000
%
%    Output:
%
%      M = 4
%      D = 23
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
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1: Fundamental Algorithms,
%    Addison Wesley, 1968, pages 155-156.
%
%    Donald Knuth,
%    The Calculation of Easter,
%    Communications of the ACM,
%    Volume 5, Number 4, April 1962, pages 209-210.
%
%    Thomas O'Beirne,
%    Puzzles and Paradoxes,
%    Oxford University Press, 1965, chapter 10.
%
%  Parameters:
%
%    Input, integer Y, the year, which must be 1583 or greater.
%    (The formula is only valid for years after the Gregorian calendar
%    was adopted.)
%
%    Output, integer M, D, the month and day of Easter.
%
  if ( y <= 0 )
    m = -1;
    d = -1;
    return
  end
%
%  E1: Set the golden number of the year in the 19-year Metonic cycle.
%
  g = year_to_golden_number ( y );
%
%  E2: Set the century.
%
  c = floor ( y / 100 ) + 1;
%
%  E3: Corrections.
%  X is the number of years divisible by 100 in which leap year was dropped.
%  Z is a special correction to synchronize Easter with the moon's orbit.
%
  x = floor ( 3 * c / 4 ) - 12;
  z = floor ( ( 8 * c + 5 ) / 25 ) - 5;
%
%  E4: Find Sunday.
%
  dd = floor ( 5 * y / 4 ) - x - 10;
%
%  E5: Epact
%
  e = i4_modp ( 11 * g + 20 + z - x, 30 );

  if ( ( e == 25 && 11 < g ) || ( e == 24 ) )
    e = e + 1;
  end
%
%  E6: Find the full moon.
%
  n = 44 - e;
  if ( n < 21 )
    n = n + 30;
  end
%
%  E7: Advance to Sunday.
%
  n = n + 7 - mod ( dd + n, 7 );
%
%  E8: Get month.
%
  if ( 31 < n )
    d = n - 31;
    m = 4;
  else
    d = n;
    m = 3;
  end

  return
end
