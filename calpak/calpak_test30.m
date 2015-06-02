function calpak_test30 ( )

%*****************************************************************************80
%
%% CALPAK_TEST30 tests MONTH_CAL_GREGORIAN.
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
  fprintf ( 1, 'CALPAK_TEST30\n' );
  fprintf ( 1, '  For the Gregorian calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_GREGORIAN prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1582;
  m = 10;
  month_cal_gregorian ( y, m );

  y = 1752;
  m = 9;
  month_cal_gregorian ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_gregorian ( jed );
  month_cal_gregorian ( y, m );

  return
end