function sparse_grid_weight_test ( rule, dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_WEIGHT_TEST checks the sum of the quadrature weights.
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

  if ( 1 <= rule & rule <= 5 )
    weight_sum_exact = 2.0^dim_num;
  elseif ( 6 == rule )
    weight_sum_exact = sqrt ( pi^dim_num );
  elseif ( 7 == rule )
    weight_sum_exact = 1.0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_WEIGHT_TEST:\n' );
  fprintf ( 1, '  Compute the weights of a sparse grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a simple test, sum these weights.\n' );
  fprintf ( 1, '  They should sum to exactly %f\n', weight_sum_exact );
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
  [ grid_weight, grid_point ] = sparse_grid ( dim_num, level_max, rule, ...
    point_num );
%
%  Sum the weights.
%
  weight_sum = sum ( grid_weight(1:point_num) );

  weight_sum_error = abs ( weight_sum - weight_sum_exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Weight sum  Expected sum    Difference\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14e  %14e  %14e\n', ...
    weight_sum, weight_sum_exact, weight_sum_error );

  return
end
