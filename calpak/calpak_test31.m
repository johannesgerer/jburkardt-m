function calpak_test31 ( )

%*****************************************************************************80
%
%% CALPAK_TEST31 tests MONTH_CAL_HEBREW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST31\n' );
  fprintf ( 1, '  For the Hebrew calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_HEBREW prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1582;
  m = 10;
  d = 1;
  f = 0.5;

  jed = ymdf_to_jed_common ( y, m, d, f );
  [ y2, m2, d2, f2 ] = jed_to_ymdf_hebrew ( jed );
  month_cal_hebrew ( y2, m2 );

  y = 1752;
  m = 9;
  d = 1;
  f = 0.5;

  jed = ymdf_to_jed_common ( y, m, d, f );
  [ y2, m2, d2, f2 ] = jed_to_ymdf_hebrew ( jed );
  month_cal_hebrew ( y2, m2 );
 
  jed = now_to_jed ( );
  [ y2, m2, d2, f2 ] = jed_to_ymdf_hebrew ( jed );
  month_cal_hebrew ( y2, m2 );

  return
end