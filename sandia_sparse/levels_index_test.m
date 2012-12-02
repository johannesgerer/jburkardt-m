function levels_index_test ( rule, dim_num, level_max )

%*****************************************************************************80
%
%% LEVELS_INDEX_TEST tests LEVELS_INDEX.
%
%  Discussion:
%
%    The routine computes the indices of the unique points used in a sparse
%    multidimensional grid whose size is controlled by a parameter LEVEL_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2007
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
  fprintf ( 1, 'LEVELS_INDEX_TEST\n' );
  fprintf ( 1, '  LEVELS_INDEX returns all grid indexes\n' );
  fprintf ( 1, '  whose level value satisfies\n' );
  fprintf ( 1, '    LEVEL_MIN <= LEVEL <= LEVEL_MAX.\n' );
  fprintf ( 1, '  Here, LEVEL is the sum of the levels of the 1D rules,\n' );
  fprintf ( 1, '  and the order of the rule is 2^LEVEL + 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are looking at rules like rule %d\n', rule );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  LEVEL_MIN =                 %d\n', level_min );
  fprintf ( 1, '  LEVEL_MAX =                 %d\n', level_max );

  point_num = levels_index_size ( dim_num, level_max, rule );

  fprintf ( 1, '  Unique points in the grid = %d\n', point_num );
%
%  Compute the orders and points.
%
  [ grid_index, grid_base ] = levels_index ( dim_num, level_max, rule, ...
    point_num );
%
%  Now we're done.  Print the merged grid data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Point     Grid indices:\n' );
  fprintf ( 1, '           Grid bases:\n' );
  fprintf ( 1, '\n' );
  for point = 1 : point_num
    fprintf ( 1, '  %4d  ', point );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_index(dim,point) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '        ' );
    for dim = 1 : dim_num
      fprintf ( 1, '%6d', grid_base(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
