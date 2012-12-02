function sparse_grid_hermite_test02 ( dim_num, level_max )

%*****************************************************************************80
%
%% TEST02 tests SPARSE_GRID_HERMITE_INDEX.
%
%  Discussion:
%
%    The routine computes the indices of the unique points used in a sparse
%    multidimensional grid whose size is controlled by a parameter LEVEL_MAX.
%
%    Once these indices are returned, they can be converted into
%    Clenshaw Curtis points.
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
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  SPARSE_GRID_HERM_INDEX returns abstract indexes for the\n' );
  fprintf ( 1, '  points that make up a Gauss-Hermite sparse grid.\n' );

  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEVEL_MIN = %d\n',level_min );
  fprintf ( 1, '  LEVEL_MAX = %d\n',level_max );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );

  point_num = sparse_grid_herm_size ( dim_num, level_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique points in the grid = %d\n', point_num );
%
%  Compute the indices.
%
  [ grid_index, grid_base] = sparse_grid_herm_index ( dim_num, level_max, point_num );
%
%  Print the indices.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid index/base:\n' );
  fprintf ( 1, '\n' );

  for point = 1 : point_num
    fprintf ( 1, '  %4d', point );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_index(dim,point) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '      ' );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_base(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
