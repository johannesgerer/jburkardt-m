function simplex_grid_test04 ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST04 tests SIMPLEX_GRID_INDEX_TO_POINT.
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
  fprintf ( 1, 'SIMPLEX_GRID_TEST04:\n' );
  fprintf ( 1, '  SIMPLEX_GRID_INDEX_TO_POINT returns the physical point\n' );
  fprintf ( 1, '  corresponding to a grid index of a simplex grid that \n' );
  fprintf ( 1, '  that uses N+1 points on a side, \n' );
  fprintf ( 1, '  in an M-dimensional simplex.\n' );

  m = 2;
  n = 5;

  v = [ 20.0, 0.0; ...
        30.0, 40.0; ...
        10.0, 20.0 ]';

  r8mat_transpose_print ( m, m + 1, v, '  Simplex vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Choosing random simplex indices to convert:\n' );
  fprintf ( 1, '   #:  1  2  3     X        Y\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for j = 1 : 10

    [ g, seed ] = simplex_grid_index_sample ( m, n, seed );
    x = simplex_grid_index_to_point ( m, n, 1, g, v );

    fprintf ( 1, '  %2d:', j );
    for i = 1 : m + 1
      fprintf ( 1, ' %2d', g(i) );
    end
    for i = 1 : m
      fprintf ( 1, ' %8.4f', x(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
