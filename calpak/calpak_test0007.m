function calpak_test0007 ( )

%*****************************************************************************80
%
%% CALPAK_TEST0007 tests DAY_LIST_COMMON
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  d1 = 1;
  d2 = 31;
  m1 = 9;
  m2 = 12;
  y1 = 2012;
  y2 = 2012;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST0007\n' );
  fprintf ( 1, '  DAY_LIST_COMMON prints a list of days between\n' );
  fprintf ( 1, '  two given YMD dates in the common calendar.\n' );
  fprintf ( 1, '\n' );
  s = ymd_to_s_common ( y1, m1, d1 );
  fprintf ( 1, '  Initial date: %s\n', s );
  s = ymd_to_s_common ( y2, m2, d2 );
  fprintf ( 1, '  Final date:   %s\n', s );
  fprintf ( 1, '\n' );

  day_list_common ( y1, m1, d1, y2, m2, d2 );

  return
end
