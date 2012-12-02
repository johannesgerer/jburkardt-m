function levels_index_size_test ( rule, dim_min, dim_max, level_max_min, ...
  level_max_max )

%*****************************************************************************80
%
%% LEVELS_INDEX_SIZE_TEST tests LEVELS_INDEX_SIZE.
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
%    Input, integer DIM_MIN, the minimum spatial dimension.
%
%    Input, integer DIM_MAX, the maximum spatial dimension.
%
%    Input, integer LEVEL_MAX_MIN, the minimum value of LEVEL_MAX.
%
%    Input, integer LEVEL_MAX_MAX, the maximum value of LEVEL_MAX.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEVELS_INDEX_SIZE_TEST\n' );
  fprintf ( 1, '  LEVELS_INDEX_SIZE returns the number of distinct\n' );
  fprintf ( 1, '  points in a sparse grid derived from a 1D rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are looking at rules like rule %d\n', rule );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each sparse grid is of spatial dimension DIM,\n' );
  fprintf ( 1, '  and is made up of product grids such that\n' );
  fprintf ( 1, '  LEVEL_MIN <= LEVEL <= LEVEL_MAX.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '   DIM: ' );
  for dim = dim_min : dim_max
    fprintf ( 1, '  %8d', dim );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '   LEVEL_MAX\n' );
  fprintf ( 1, '   ---------\n' );

  for level_max = level_max_min : level_max_max

    fprintf ( 1, '    %4d', level_max )

    for dim_num = dim_min : dim_max

      point_num = levels_index_size ( dim_num, level_max, rule );
      fprintf ( 1, '  %8d', point_num )
    end

    fprintf ( 1, '\n' );

  end

  return
end
