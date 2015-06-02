function calpak_test605 ( )

%*****************************************************************************80
%
%% CALPAK_TEST605 tests YEAR_LENGTH_ISLAMIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST605\n' );
  fprintf ( 1, '  For the Islamic calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_ISLAMIC determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 500 : 505
    sy = y_to_s_islamic ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_islamic ( y ) );
  end

  return
end