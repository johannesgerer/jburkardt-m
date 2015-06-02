function calpak_test5153 ( )

%*****************************************************************************80
%
%% CALPAK_TEST5153 tests YEAR_CAL_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST5153\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  YEAR_CAL_COMMON prints a year calendar.\n' );
  fprintf ( 1, '\n' );
 
  y = 1968;
  year_cal_common ( y );

  return
end