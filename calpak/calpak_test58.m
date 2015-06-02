function calpak_test58 ( )

%*****************************************************************************80
%
%% CALPAK_TEST58 tests YEAR_LENGTH_ENGLISH.
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
  fprintf ( 1, 'CALPAK_TEST58\n' );
  fprintf ( 1, '  For the English calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_ENGLISH determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 1580 : 1585
    sy = y_to_s_english ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_english ( y ) );
  end

  for y = 1750 : 1755
    sy = y_to_s_english ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_english ( y ) );
  end

  for y = 1000 : 100 : 2000
    sy = y_to_s_english ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_english ( y ) );
  end

  return
end
