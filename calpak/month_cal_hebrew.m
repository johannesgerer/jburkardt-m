function month_cal_hebrew ( y, m )

%*****************************************************************************80
%
%% MONTH_CAL_HEBREW prints a Hebrew month calendar.
%
%  Format:
%
%    HEBREW CALENDAR
%    month year AM
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
%    19 March 2013
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
  [ y2, m2, ierror ] = ym_check_hebrew ( y2, m2 );

  if ( ierror ~= 0 )
    return
  end
%
%  Find the day of the week for Y M 1.
%
  d = 1;
  f = 0.0;

  w = ymdf_to_weekday_hebrew ( y2, m2, d, f );
%
%  Find the appropriate label for the first box in the calendar.
%
  iday = 2 - w;
%
%  Print out a heading.
%
  s1 = month_to_month_name_hebrew ( y2, m2 );
  s2 = y_to_s_hebrew ( y );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEBREW CALENDAR\n' );
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
%
  while ( iday <= month_length_hebrew ( y2, m2 ) )

    fprintf ( 1, ' ' );

    for w = 1 : 7

      if ( iday < 1 )
        fprintf ( 1, '   ' );
      elseif ( month_length_hebrew ( y2, m2 ) < iday )
        fprintf ( 1, '   ' );
      else
        fprintf ( 1, ' %2d', iday );
      end

      iday = iday + 1;

    end

    fprintf ( 1, '\n' );

  end

  return
end
