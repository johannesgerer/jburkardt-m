function month_cal_common ( y, m )

%*****************************************************************************80
%
%% MONTH_CAL_COMMON prints a Common month calendar.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    day JED = 2299160, and Gregorian from day JED = 2299161 and after.
%
%  Format:
%
%    COMMON CALENDAR
%    APRIL 1997 CE
%
%    Su  M Tu  W Th  F Sa
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
%    17 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, the YM date.
%

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
  d = 1;
  f = 0.0;

  w = ymdf_to_weekday_common ( y2, m2, d, f );
%
%  Find the appropriate label for the first box in the calendar.
%
  iday = 2 - w;
%
%  Print out a heading.
%
  s1 = month_to_month_name_common ( m2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMMON CALENDAR\n' );
  s2 = y_to_s_common ( y2 );
  fprintf ( 1, '%s %s\n', s1, s2 );
  fprintf ( 1, '\n' );
%
%  Get the days of the week.
%
  fprintf ( 1, ' ' );
  for w = 1 : 7
    lab = weekday_to_name_common2 ( w );
    fprintf ( 1, '%3s', lab );
  end
  fprintf ( 1, '\n' );
%
%  Print out a line of day numbers.
%  IDAY keeps track of the numerical day,
%  D2 keeps track of the label for the day, which  only differed
%  from IDAY in October 1582.
%
  d2 = iday;
  f2 = 0.0;
  d_max = month_length_common ( y2, m2 );

  while ( iday <= d_max )

    fprintf ( 1, ' ' );

    for w = 1 : 7

      if ( iday < 1 )
        fprintf ( 1, '   ' );
      elseif ( d_max < iday )
        fprintf ( 1, '   ' );
      else
        fprintf ( 1, ' %2d', d2 );
      end

      iday = iday + 1;

      [ y2, m2, d2, f2 ] = ymdf_next_common ( y2, m2, d2, f2 );

    end

    fprintf ( 1, '\n' );

  end

  return
end
