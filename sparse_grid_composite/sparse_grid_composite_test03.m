function sparse_grid_composite_test03 ( dim_num, level_max )
 
%*****************************************************************************80
%
%% SPARSE_GRID_COMPOSITE_TEST03 calls SPARSE_GRID_COMPOSITE to create a grid.
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
  fprintf ( 1, 'SPARSE_GRID_COMPOSITE_TEST03:\n' );
  fprintf ( 1, '  SPARSE_GRID_COMPOSITE makes a sparse composite grid.\n' );
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
%  Print them out.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid weights:\n' );
  fprintf ( 1, '\n' );
  for point = 1 : point_num
    fprintf ( 1, '  %4d  %10f\n', point, grid_weight(point) );
  end
   
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid points:\n' );
  fprintf ( 1, '\n' );
  for point = 1 : point_num
    fprintf ( 1, '  %4d', point );
    for dim = 1 : dim_num
      fprintf ( 1, '%10f', grid_point(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
