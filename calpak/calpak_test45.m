function calpak_test45 ( )

%*****************************************************************************80
%
%% CALPAK_TEST45 tests NEW_YEAR_TO_JED_HEBREW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST45\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  NEW_YEAR_TO_JED_HEBREW determines the JED of\n' );
  fprintf ( 1, '  the first day of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  YEAR       JED         YMDF\n' );
  fprintf ( 1, '  Hebrew                 Common\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 20
    y1 = 5760 + i;
    s1 = y_to_s_hebrew ( y1 );
    jed2 = new_year_to_jed_hebrew ( y1 );
    [ y3, m3, d3, f3 ] = jed_to_ymdf_common ( jed2 );
    s3 = ymdf_to_s_common ( y3, m3, d3, f3 );
    fprintf ( 1, '  %s  %11.2f     %s\n', s1, jed2, s3 );
  end

  return
end
