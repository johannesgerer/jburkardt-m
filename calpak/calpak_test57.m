function calpak_test57 ( )

%*****************************************************************************80
%
%% CALPAK_TEST57 tests YEAR_LENGTH_COMMON.
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
  fprintf ( 1, 'CALPAK_TEST57\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_COMMON determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 1580 : 1585
    sy = y_to_s_common ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_common ( y ) );
  end

  for y = 1750 : 1755
    sy = y_to_s_common ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_common ( y ) );
  end

  for y = 1000 : 100 : 2000
    sy = y_to_s_common ( y );
    fprintf ( 1, '  %10s  %d\n', sy, year_length_common ( y ) );
  end

  return
end
