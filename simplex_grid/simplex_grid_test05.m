function simplex_grid_test05 ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST05 tests SIMPLEX_GRID_INDEX_ALL.
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
  fprintf ( 1, 'SIMPLEX_GRID_TEST05:\n' );
  fprintf ( 1, '  SIMPLEX_GRID_INDEX_ALL returns all the indices\n' );
  fprintf ( 1, '  of a simplex grid that uses N+1 points on a side, \n' );
  fprintf ( 1, '  in an M-dimensional simplex.\n' );

  m = 3;
  n = 3;
  ng = simplex_grid_size ( m, n );

  grid = simplex_grid_index_all ( m, n, ng );

  i4mat_transpose_print ( m + 1, ng, grid, ...
    '  Transposed Simplex Grid Index Matrix:' )

  return
end
