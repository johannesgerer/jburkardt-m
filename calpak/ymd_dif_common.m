function days = ymd_dif_common ( y1, m1, d1, y2, m2, d2 )

%*****************************************************************************80
%
%% YMD_DIF_COMMON gets the day difference between two Common YMD dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, the first YMD date.
%
%    Input, integer Y2, M2, D2, the second YMD date.
%
%    Output, integer DAYS, the number of days between the dates.
%
  days = 0;
%
%  Check the dates.
%
  [ y1, m1, d1, ierror ] = ymd_check_common ( y1, m1, d1 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMD_DIF_COMMON - Fatal error!\n' );
    fprintf ( 1, '  Y1/M1/D1 is illegal.\n' );
    error ( 'YMD_DIF_COMMON - Fatal error!' );
  end

  [ y2, m2, d2, ierror ] = ymd_check_common ( y2, m2, d2 );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMD_DIF_COMMON - Fatal error!\n' );
    fprintf ( 1, '  Y2/M2/D2 is illegal.\n' );
    error ( 'YMD_DIF_COMMON - Fatal error!' );
  end

  jed1 = ymd_to_jed_common ( y1, m1, d1 );

  jed2 = ymd_to_jed_common ( y2, m2, d2 );

  days = round ( jed2 - jed1 );

  return
end
