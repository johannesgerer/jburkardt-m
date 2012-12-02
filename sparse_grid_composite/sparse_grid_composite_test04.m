function sparse_grid_composite_test04 ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_COMPOSITE_TEST04 sums the weights and compares them to 2^DIM_NUM.
%
%  Discussion:
%
%    This routine gets the sparse grid indices and determines the 
%    corresponding sparse grid abscissas.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
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
  fprintf ( 1, 'SPARSE_GRID_COMPOSITE_TEST04:\n' );
  fprintf ( 1, '  Compute the weights of a composite sparse grid .\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly 2^DIM_NUM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MAX = %d\n', level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
%
%  Determine the number of points.
%
  point_num = sparse_grid_composite_size ( dim_num, level_max );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point ] = sparse_grid_composite ( dim_num, level_max, point_num );
%
%  Sum the weights.
%
  weight_sum = sum ( grid_weight(1:point_num) );

  weight_sum_exact = 2.0^dim_num;
  
  weight_sum_error = abs ( weight_sum - weight_sum_exact );
  
  fprintf ( 1, '\n' ) ;
  fprintf ( 1, '    Weight sum     Exact sum    Difference\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12e  %12e  %12e\n', ...
    weight_sum, weight_sum_exact, weight_sum_error );

  return
end
