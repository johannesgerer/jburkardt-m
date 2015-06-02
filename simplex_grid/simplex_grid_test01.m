function simplex_grid_test01 ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST01 tests SIMPLEX_GRID_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GRID_TEST01:\n' );
  fprintf ( 1, '  SIMPLEX_GRID_SIZE counts the points in a regular grid\n' );
  fprintf ( 1, '  with N+1 points on a side, in an M-dimensional simplex.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        M: 0     1     2     3     4     5\n' );
  fprintf ( 1, '    N:\n' );
  for n = 0 : 10
    fprintf ( 1, '  %3d:', n );
    for m = 0 : 5
      fprintf ( 1, '%6d', simplex_grid_size ( m, n ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
