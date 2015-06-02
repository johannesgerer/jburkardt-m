function pyramid_grid_test03 ( )

%*****************************************************************************80
%
%% PYRAMID_GRID_TEST03 tests PYRAMID_UNIT_GRID_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_GRID_TEST03\n' );
  fprintf ( 1, '  PYRAMID_UNIT_GRID_PLOT plots a unit pyramid\n' );
  fprintf ( 1, '  grid with N+1 points along each edge.\n' );

  n = 5;
  r8_print ( n, '  Grid parameter N:' );

  ng = pyramid_grid_size ( n );
  r8_print ( ng, '  Grid size NG:' );

  pg = pyramid_unit_grid ( n, ng );

  header = 'pyramid_unit';
  pyramid_unit_grid_plot ( n, ng, pg, header );

  return
end
