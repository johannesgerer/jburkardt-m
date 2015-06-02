function calpak_test325 ( )

%*****************************************************************************80
%
%% CALPAK_TEST325 tests MONTH_CAL_REPUBLICAN.
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
  fprintf ( 1, 'CALPAK_TEST325\n' );
  fprintf ( 1, '  For the Republican calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_REPUBLICAN prints a month calendar.\n' );
 
  y = 3;
  m = 12;
  month_cal_republican ( y, m );

  y = 3;
  m = 13;
  month_cal_republican ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_republican ( jed );
  month_cal_republican ( y, m );

  return
end