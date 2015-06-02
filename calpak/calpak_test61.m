function calpak_test61 ( )

%*****************************************************************************80
%
%% CALPAK_TEST61 tests YEAR_LENGTH_JULIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST61\n' );
  fprintf ( 1, '  For the Julian calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_JULIAN determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 1580 : 1585
    sy = y_to_s_julian ( y );
    fprintf ( 1, '  %10s  %3d\n', sy, year_length_julian ( y ) );
  end

  for y = 1750 : 1755
    sy = y_to_s_julian ( y );
    fprintf ( 1, '  %10s  %3d\n', sy, year_length_julian ( y ) );
  end

  for y = 1000 : 100 : 2000
    sy = y_to_s_julian ( y );
    fprintf ( 1, '  %10s  %3d\n', sy, year_length_julian ( y ) );
  end

  return
end
