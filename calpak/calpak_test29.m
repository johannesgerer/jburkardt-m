function calpak_test29 ( )

%*****************************************************************************80
%
%% CALPAK_TEST29 tests MONTH_CAL_ENGLISH.
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
  fprintf ( 1, 'CALPAK_TEST29\n' );
  fprintf ( 1, '  For the English calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_ENGLISH prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1582;
  m = 10;
  month_cal_english ( y, m );

  y = 1752;
  m = 9;
  month_cal_english ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_english ( jed );
  month_cal_english ( y, m );

  return
end