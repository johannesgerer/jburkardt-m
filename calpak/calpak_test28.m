function calpak_test28 ( )

%*****************************************************************************80
%
%% CALPAK_TEST28 tests MONTH_CAL_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST28\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_COMMON prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1582;
  m = 10;
  month_cal_common ( y, m );

  y = 1752;
  m = 9;
  month_cal_common ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_common ( jed );
  month_cal_common ( y, m );

  return
end
