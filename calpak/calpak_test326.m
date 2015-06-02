function calpak_test326 ( )

%*****************************************************************************80
%
%% CALPAK_TEST326 tests MONTH_CAL_ROMAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST326\n' );
  fprintf ( 1, '  For the Roman calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_ROMAN prints a month calendar.\n' );
 
  y = 100;
  m = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year = %d\n', y );
  fprintf ( 1, '  Month = %d\n', m );

  month_cal_roman ( y, m );

  y = 256;
  m = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year = %d\n', y );
  fprintf ( 1, '  Month = %d\n', m );

  month_cal_roman ( y, m );
 
  return
end
