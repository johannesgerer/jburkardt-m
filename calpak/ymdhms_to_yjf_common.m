function [ y2, j2, f2 ] = ymdhms_to_yjf_common ( y1, m1, d1, h1, n1, s1 )

%*****************************************************************************80
%
%% YMDHMS_TO_YJF_COMMON converts a YMDHMS date to a YJF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, H1, N1, S1,
%    the year, month, day, hour, minute and second of the date.
%
%    Output, integer Y2, J2, real F2, the YJF date.
%

%
%  Check the date.
%
  [ y1, m1, d1, h1, n1, s1, ierror ] = ymdhms_check_common ( y1, m1, d1, ...
    h1, n1, s1 );

  if ( ierror ~= 0 )
    y2 = 0;
    j2 = 0;
    f2 = 0.0;
    return
  end
%
%  Start the day number at 0.
%
  y2 = y1;
  j2 = 0;
%
%  Add in the days of the elapsed months.
%
  for i = 1 : m1 - 1
    j2 = j2 + month_length_common ( y2, i );
  end
%
%  Add in the elapsed days of the current month.
%
  j2 = j2 + d1;
%
%  Now compute the day fraction.
%
  f2 = ( ( h1 * 60 + n1 ) * 60 + s1 ) / ( 24 * 60 * 60 );

  return
end