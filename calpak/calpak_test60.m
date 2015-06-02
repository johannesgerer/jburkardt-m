function calpak_test60 ( )

%*****************************************************************************80
%
%% CALPAK_TEST60 tests YEAR_LENGTH_HEBREW.
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
  fprintf ( 1, 'CALPAK_TEST60\n' );
  fprintf ( 1, '  For the Hebrew calendar,\n' );
  fprintf ( 1, '  YEAR_LENGTH_HEBREW determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 5760 : 5780
    sy = y_to_s_hebrew ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_hebrew ( y ) );
  end

  return
end