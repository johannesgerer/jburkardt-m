function month_cal_roman ( y, m )

%*****************************************************************************80
%
%% MONTH_CAL_ROMAN prints a Roman month calendar.
%
%  Format:
%
%    ROMAN CALENDAR
%    Aprilis DVI AUC
%
%    Kalends Aprilis
%    Ante diem iv Nones Aprilis
%    Ante diem iii Nones Aprilis
%    Pridie Nones Aprilis
%    Nones Aprilis
%    Ante diem viii Ides Aprilis
%    Ante diem vii Ides Aprilis
%    Ante diem vi Ides Aprilis
%    Ante diem v Ides Aprilis
%    Ante diem iv Ides Aprilis
%    Ante diem iii Ides Aprilis
%    Pridie Ides Aprilis
%    Ides Aprilis
%    Ante diem xvii Kalends Maius
%    Ante diem xvi Kalends Maius
%    ...
%    Ante diem iv Kalends Maius
%    Ante diem iii Kalends Maius
%    Pridie Kalends Maius
%
%  Discussion:
%
%    "AUC" means "ab urbe condita", or "from the founding of the city".
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
  [ y2, m2, ierror ] = ym_check_roman ( y2, m2 );

  if ( ierror ~= 0 )
    return
  end
%
%  Print out a heading.
%
  s_month = month_to_month_name_roman ( m2 );

  m3 = i4_wrap ( m2 + 1, 1, 12 );

  s_month_next = month_to_month_name_roman ( m3 );
  s_year = i4_to_roman ( y2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ROMAN CALENDAR\n' );
  fprintf ( 1, '%s AUC %s\n', s_month, s_year );
  fprintf ( 1, '\n' );

  nones = month_to_nones_roman ( m2 );
  ides = month_to_ides_roman ( m2 );
  last = month_length_roman ( y2, m2 );

  for iday = 1 : last

    if ( iday == 1 )
      fprintf ( 1, 'Kalends %s\n', s_month );
    elseif ( iday < nones - 1 )
      jday = nones + 1 - iday;
      s_day = i4_to_roman ( jday );
      fprintf ( 1, 'Ante diem %s Nones %s\n', s_day, s_month );
    elseif ( iday == nones - 1 )
      fprintf ( 1,  'Pridie Nones %s\n', s_month );
    elseif ( iday == nones )
      fprintf ( 1,  'Nones %s\n', s_month );
    elseif ( iday < ides - 1 )
      jday = ides + 1 - iday;
      s_day = i4_to_roman ( jday );
      fprintf ( 1,  'Ante diem %s Ides %s\n', s_day, s_month );
    elseif ( iday == ides - 1 )
      fprintf ( 1,  'Pridie Ides %s\n', s_month );
    elseif ( iday == ides )
      fprintf ( 1,  'Ides %s\n', s_month );

    elseif ( m2 == 2 && year_is_leap_roman ( y2 ) )

      if ( iday < 25 )
        jday = last + 1 - iday;
        s_day = i4_to_roman ( jday );
        fprintf ( 1,  'Ante diem %s Kalends %s\n', s_day, s_month_next );
      elseif ( iday == 25 )
        jday = last + 2 - iday;
        s_day = i4_to_roman ( jday );
        fprintf ( 1,  'Ante diem Bis %d Kalends %d\n', s_day, s_month_next );
      elseif ( iday < last )
        jday = last + 2 - iday;
        s_day = i4_to_roman ( jday );
        fprintf ( 1,  'Ante diem %d Kalends %d\n', s_day, s_month_next );
      else
        fprintf ( 1,  'Pridie Kalends %s\n', s_month_next );
      end

    elseif ( iday < last )
      jday = last + 2 - iday;
      sday = i4_to_roman ( jday );
      fprintf ( 1,  'Ante diem %s Kalends %s\n', s_day, s_month_next );
    else
      fprintf ( 1, 'Pridie Kalends %s\n', s_month_next );
    end

  end

  return
end
