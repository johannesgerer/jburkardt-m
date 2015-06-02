function lines = month_cal_store_common ( y, m )

%*****************************************************************************80
%
%% MONTH_CAL_STORE_COMMON stores a Common month calendar.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian before
%    the transition date, and Gregorian afterwards, with the transition date
%    best specified as as JED = 2299160.
%
%  Format:
%
%           1  2  3  4  5
%     6  7  8  9 10 11 12
%    13 14 15 16 17 18 19
%    20 21 22 23 24 25 26
%    27 28 29 30
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y,  M, the YM date.
%
%    Output, string LINES(6,20), the lines of the calendar.
%
  lines = [];
%
%  Make local copies of the input.
%
  m2 = m;
  y2 = y;
%
%  Check the month and year.  After this call, month is
%  guaranteed to be between 1 and 12.
%
  [ y2, m2, ierror ] = ym_check_common ( y2, m2 );

  if ( ierror ~= 0 )
    return
  end
%
%  Find the day of the week for Y M 1.
%
  d2 = 1;
  f2 = 0.0;

  w = ymdf_to_weekday_common ( y2, m2, d2, f2 );

  days = month_length_common ( y2, m2 );
%
%  Find the appropriate label for the first box in the calendar.
%
  iday = 2 - w;
%
%  Print out a line of day numbers.
%  IDAY keeps track of the numerical day,
%  JDAY keeps track of the label for the day, which differed in October 1582.
%
  d2 = iday;
  f2 = 0.0;

  n_line = 0;

  while ( n_line < 6 )
% while ( iday <= days )

    n_line = n_line + 1;
    s = '                    ';

    for w = 1 : 7

      i1 = 3 * ( w - 1 ) + 1;
      i2 = i1 + 1;

      if ( 1 <= iday && iday <= days )
        s(i1:i2) = sprintf ( '%2d', d2 );
      else
        s(i1:i2) = '  ';
      end

      iday = iday + 1;

      [ y2, m2, d2, f2 ] = ymdf_next_common ( y2, m2, d2, f2 );

    end

    lines = [ lines; s ];

  end

  return
end