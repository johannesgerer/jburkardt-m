function pyramid_grid_test02 ( )

%*****************************************************************************80
%
%% PYRAMID_GRID_TEST02 tests PYRAMID_UNIT_GRID.
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
  fprintf ( 1, 'PYRAMID_GRID_TEST02\n' );
  fprintf ( 1, '  PYRAMID_UNIT_GRID determines a unit pyramid\n' );
  fprintf ( 1, '  grid with N+1 points along each edge.\n' );

  n = 4;
  r8_print ( n, '  Grid parameter N:' );

  ng = pyramid_grid_size ( n );
  r8_print ( ng, '  Grid size NG:' );

  pg = pyramid_unit_grid ( n, ng );

  r8mat_transpose_print ( 3, ng, pg, '  Pyramid grid points:' );

  return
end
