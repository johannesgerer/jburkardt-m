function month_cal_republican ( y, m )

%*****************************************************************************80
%
%% MONTH_CAL_REPUBLICAN prints a Republican month calendar.
%
%  Format:
%
%    REPUBLICAN CALENDAR
%    Brumaire 3 ER
%
%     1  2  3  4  5  6  7  8  9 10
%    11 12 13 14 15 16 17 18 19 20
%    21 22 23 24 25 26 27 28 29 30
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2013
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
%  Check the month and year.
%
  [ y2, m2, ierror ] = ym_check_republican ( y2, m2 );

  if ( ierror ~= 0 )
    return
  end
%
%  Print out a heading.
%
  s1 = month_to_month_name_republican ( m2 );
  s2 = y_to_s_republican ( y2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Republican Calendar\n' );
  fprintf ( 1, '%s %s\n', s1, s2 );
  fprintf ( 1, '\n' );
%
%  Get the days of the week.
%
  for w = 1 : 10
    fprintf ( 1, '%3d', w );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
%
%  Print out a line of day numbers.
%
  iday = 1;

  while ( iday <= month_length_republican ( y2, m2 ) )

    for w = 1 : 10

      if ( month_length_republican ( y2, m2 ) < iday )
        fprintf ( 1, '   ' );
      else
        fprintf ( 1, '%3d', iday );
      end

      iday = iday + 1;

    end

    fprintf ( 1, '\n' );

  end

  return
end