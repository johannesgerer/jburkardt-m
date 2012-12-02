function sparse_grid_hermite_test04 ( dim_num, level_max )

%*****************************************************************************80
%
%% TEST04 sums the weights and compares them to sqrt (PI^DIM_NUM).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04:\n' );
  fprintf ( 1, '  Compute the weights of a Gauss-Hermite sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to sqrt(pi^DIM_NUM).\n' );

  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MIN = %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
%
%  Determine the number of points.
%
  point_num = sparse_grid_herm_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point ] = sparse_grid_herm ( dim_num, level_max, ...
    point_num );
%
%  Sum the weights.
%
  weight_sum = sum ( grid_weight(1:point_num) );

  weight_sum_exact = sqrt ( pi^dim_num );

  weight_sum_error = abs ( weight_sum - weight_sum_exact );

  fprintf ( 1, '\n' ) ;
  fprintf ( 1, '    Weight sum     Exact sum    Difference\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12e  %12e  %12e\n', ...
    weight_sum, weight_sum_exact, weight_sum_error );

  return
end
