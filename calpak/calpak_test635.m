function calpak_test635 ( )

%*****************************************************************************80
%
%% CALPAK_TEST635 tests YEAR_TO_INDICTION_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST635\n' );
  fprintf ( 1, '  For a Common year,\n' );
  fprintf ( 1, '  YEAR_TO_INDICTION_COMMON determines the indiction number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Indiction Number\n' );
  fprintf ( 1, '\n' );

  for y = -1 : 13

    y2 = y_astronomical_to_common ( y );
    sy = y_to_s_common ( y2 );
    i = year_to_indiction_common ( y2 );
    fprintf ( 1, '  %10s  %i2\n', sy, i );

  end

  return
end