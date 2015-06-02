function calpak_test585 ( )

%*****************************************************************************80
%
%% CALPAK_TEST585 tests YEAR_LENGTH_GREEK.
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
  fprintf ( 1, 'CALPAK_TEST585\n' );
  fprintf ( 1, '  For the Greek calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_GREEK determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 10
    sy = y_to_s_greek ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_greek ( y ) );
  end

  return
end
