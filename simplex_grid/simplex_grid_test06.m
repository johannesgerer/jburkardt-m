function simplex_grid_test06 ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST06 tests SIMPLEX_GRID_INDEX_TO_POINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GRID_TEST06:\n' );
  fprintf ( 1, '  SIMPLEX_GRID_INDEX_TO_POINT returns the physical point\n' );
  fprintf ( 1, '  corresponding to a grid index of a simplex grid that \n' );
  fprintf ( 1, '  that uses N+1 points on a side, \n' );
  fprintf ( 1, '  in an M-dimensional simplex.\n' );

  m = 2;
  n = 5;
  ng = simplex_grid_size ( m, n );

  v = [ 20.0, 0.0; ...
        30.0, 40.0; ...
        10.0, 20.0 ]';

  r8mat_transpose_print ( m, m + 1, v, '  Simplex vertices:' );

  grid = simplex_grid_index_all ( m, n, ng );

  x = simplex_grid_index_to_point ( m, n, ng, grid, v );

  r8mat_transpose_print ( m, ng, x, '  Grid Point Coordinates:' );

  return
end
