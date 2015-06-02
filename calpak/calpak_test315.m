function calpak_test315 ( )

%*****************************************************************************80
%
%% CALPAK_TEST315 tests MONTH_CAL_ISLAMIC_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST315\n' );
  fprintf ( 1, '  For the Islamic A calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_ISLAMIC_A prints a month calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 500;
  m = 1;
  month_cal_islamic_a ( y, m );

  y = 500;
  m = 2;
  month_cal_islamic_a ( y, m );
 
  jed = now_to_jed ( );
  [ y, m, d, f ] = jed_to_ymdf_islamic_a ( jed );
  month_cal_islamic_a ( y, m );

  return
end