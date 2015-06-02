function [ y2, m2, d2, f2 ] = ymdhms_to_ymdf_common ( y1, m1, d1, h1, n1, s1 )

%*****************************************************************************80
%
%% YMDHMS_TO_YMDF_COMMON converts a YMDHMS date to a YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2013
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
%    Output, integer Y2, M2, D2, real F2, 
%    the YMDF date.
%

%
%  Check the date.
%
  [ y, m, d, h, n, s, ierror ] = ymdhms_check_common ( y1, m1, d1, h1, ...
    n1, s1 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMDHMS_TO_YMDF_COMMON - Fatal error!\n' );
    error ( 'YMDHMS_TO_YMDF_COMMON - Fatal error!' );
  end

  y2 = y1;
  m2 = m1;
  d2 = d1;
%
%  Now compute the day fraction.
%
  f2 = ( ( h1 * 60 + n1 ) * 60 + s1 ) / ( 24 * 60 * 60 );

  return
end