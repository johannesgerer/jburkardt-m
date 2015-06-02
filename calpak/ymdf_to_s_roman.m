function s = ymdf_to_s_roman ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_ROMAN writes a Roman YMDF date into a string.
%
%  Example:
%
%     Y  M   D  F    S
%    --  -  --  ---  -----------------------------------
%    56  4   1  0.1  Kalends Aprilis DVI AUC
%    56  4   2  0.2  Ante diem iv Nones Aprilis DVI AUC
%    56  4   3  0.3  Ante diem iii Nones Aprilis DVI AUC
%    56  4   4  0.4  Pridie Nones Aprilis DVI AUC
%    56  4   5  0.5  Nones Aprilis DVI AUC
%    56  4   6  0.6  Ante diem viii Ides Aprilis DVI AUC
%    56  4   7  0.7  Ante diem vii Ides Aprilis DVI AUC
%    56  4   8  0.8  Ante diem vi Ides Aprilis DVI AUC
%    56  4   9  0.9  Ante diem v Ides Aprilis DVI AUC
%    56  4  10  0.0  Ante diem iv Ides Aprilis DVI AUC
%    56  4  11  0.0  Ante diem iii Ides Aprilis DVI AUC
%    56  4  12  0.0  Pridie Ides Aprilis DVI AUC
%    56  4  13  0.0  Ides Aprilis DVI AUC
%    56  4  14  0.0  Ante diem xvii Kalends Maius DVI AUC
%    56  4  15  0.0  Ante diem xvi Kalends Maius DVI AUC
%    ...
%    56  4  28  0.0  Ante diem iv Kalends Maius DVI AUC
%    56  4  29  0.0  Ante diem iii Kalends Maius DVI AUC
%    56  4  30  0.0  Pridie Kalends Maius DVI AUC
%
%  Discussion:
%
%    "AUC" means "ab urbe condita", or "from the founding of the city".
%
%    At the moment, we ignore F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, string S, a string representing the date.
%

%
%  Check the input.
%
  [ y2, m2, d2, ierror ] = ymd_check_roman ( y, m, d );

  if ( ierror ~= 0 )
    s = '?';
    return
  end

  s_month = month_to_month_name_roman ( m2 );
%
%  Get the next month's name.
%
  m3 = i4_wrap ( m2 + 1, 1, 12 );
  s_month_next = month_to_month_name_roman ( m3 );

  nones = month_to_nones_roman ( m2 );
  ides = month_to_ides_roman ( m2 );
  last = month_length_roman ( y2, m2 );

  if ( d2 == 1 )
    s = [ 'Kalends ', s_month ];
  elseif ( d2 < nones - 1 )
    jday = nones + 1 - d2;
    s_day = i4_to_roman ( jday );
    s = [ 'Ante diem ', s_day, ' Nones ', s_month ];
  elseif ( d2 == nones - 1 )
    s = [ 'Pridie Nones ', s_month ];
  elseif ( d2 == nones )
    s = [ 'Nones ', s_month ];
  elseif ( d2 < ides - 1 )
    jday = ides + 1 - d2;
    s_day = i4_to_roman ( jday );
    s = [ 'Ante diem ', s_day, ' Ides ', s_month ];
  elseif ( d2 == ides - 1 )
    s = [ 'Pridie Ides ', s_month ];
  elseif ( d2 == ides )
    s = [ 'Ides ', s_month ];
  elseif ( m2 == 2 && year_is_leap_roman ( y2 ) )

    if ( d2 < 25 )
      jday = last + 1 - d2;
      s_day = i4_to_roman ( jday );
      s = [ 'Ante diem ', s_day, ' Kalends ', s_month_next ];
    elseif ( d2 == 25 )
      jday = last + 2 - d2;
      s_day = i4_to_roman ( jday );
      s = [ 'Ante diem Bis ', s_day, ' Kalends ', s_month_next ];
    elseif ( d2 < last )
      jday = last + 2 - d2;
      s_day = i4_to_roman ( jday );
      s = [ 'Ante diem ', s_day, ' Kalends ', s_month_next ];
    else
      s = [ 'Pridie Kalends ', s_month_next ];
    end

  elseif ( d2 < last )
    jday = last + 2 - d2;
    s_day = i4_to_roman ( jday );
    s = [ 'Ante diem ', s_day, ' Kalends ', s_month_next ];
  else
    s = [ 'Pridie Kalends ', s_month_next ];
  end

  s_year = i4_to_roman ( y2 );
  s = [ s, ' ', s_year, ' AUC' ];

  s = s_blanks_delete ( s );

  return
end
