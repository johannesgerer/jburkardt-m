function sparse_grid_compute_test ( rule, dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_COMPUTE_TEST computes and prints a sparse grid rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%    1, "CC", Clenshaw Curtis Closed Fully Nested rule.
%    2, "F1", Fejer 1 Open Fully Nested rule.
%    3, "F2", Fejer 2 Open Fully Nested rule.
%    4, "GP", Gauss Patterson Open Fully Nested rule.
%    5, "GL", Gauss Legendre Open Weakly Nested rule.
%    6, "GH", Gauss Hermite Open Weakly Nested rule.
%    7, "LG", Gauss Laguerre Open Non Nested rule.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level.
%
  level_min = max ( 0, level_max + 1 - dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_COMPUTE_TEST:\n' );
  fprintf ( 1, '  SPARSE_GRID can make a sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  LEVEL_MIN =                 %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX =                 %d\n', level_max );
  fprintf ( 1, '  1D quadrature index RULE =  %d\n', rule );
%
%  Determine the number of points.
%
  point_num = levels_index_size ( dim_num, level_max, rule );

  fprintf ( 1, '  Unique points in the grid = %d\n', point_num );
%
%  Compute the weights and points.
%
  [ grid_weight, grid_point ] = sparse_grid ( dim_num, level_max, ...
    rule, point_num );
%
%  Print them out.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid weights:\n' );
  fprintf ( 1, '\n' );
  for point = 1 : point_num
    fprintf ( 1, '  %4d  %14.6e\n', point, grid_weight(point) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid points:\n' );
  fprintf ( 1, '\n' );
  for point = 1 : point_num
    fprintf ( 1, '  %4d  ', point );
    for dim = 1 : dim_num
      fprintf ( 1, '%14.6e', grid_point(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
