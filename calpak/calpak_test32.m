function calpak_test32 ( )

%*****************************************************************************80
%
%% CALPAK_TEST32 tests MONTH_CAL_JULIAN.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST32\n' );
  fprintf ( 1, '  For the Julian calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_JULIAN prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1582;
  m = 10;
  month_cal_julian ( y, m );

  y = 1752;
  m = 9;
  month_cal_julian ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_julian ( jed );
  month_cal_julian ( y, m );

  return
end
