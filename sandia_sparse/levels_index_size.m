function point_num = levels_index_size ( dim_num, level_max, rule )

%*****************************************************************************80
%
%% LEVELS_INDEX_SIZE sizes a sparse grid.
%
%  Discussion:
%
%    The sparse grid is the logical sum of product grids with total LEVEL
%    between LEVEL_MIN and LEVEL_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
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
%    Output, integer POINT_NUM, the total number of unique
%    points in the grids.
%
  if ( rule == 1 )
    point_num = sparse_grid_cc_size ( dim_num, level_max );
  elseif ( 2 <= rule & rule <= 4 )
    point_num = sparse_grid_ofn_size ( dim_num, level_max );
  elseif ( 5 <= rule & rule <= 6 )
    point_num = levels_index_size_own ( dim_num, level_max );
  elseif ( 7 == rule )
    point_num = levels_index_size_onn ( dim_num, level_max );
  else
    point_num = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEVELS_INDEX_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized value of RULE = %d\n', rule );
    error ( 'LEVELS_INDEX_SIZE - Fatal error!' );
  end

  return
end
