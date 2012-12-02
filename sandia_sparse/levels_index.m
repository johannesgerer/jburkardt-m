function [ grid_index, grid_base ] = levels_index ( dim_num, level_max, rule, ...
  point_num )

%*****************************************************************************80
%
%% LEVELS_INDEX indexes a sparse grid.
%
%  Discussion:
%
%    The sparse grid is the logical sum of product grids with total LEVEL
%    between LEVEL_MIN and LEVEL_MAX.
%
%    The necessary dimensions of GRID_INDEX can be determined by
%    calling LEVELS_INDEX_SIZE first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2008
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
%    Input, integer POINT_NUM, the total number of points
%    in the grids.
%
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of
%    point indices, representing a subset of the product grid of level
%    LEVEL_MAX, representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%
%    Output, integer GRID_BASE(DIM_NUM,POINT_NUM), a list of
%    the orders of the rules associated with each point and dimension.
%
  if ( rule == 1 )
    [ grid_index, grid_base ] = levels_index_cfn ( dim_num, level_max, ...
      point_num );
  elseif ( 2 <= rule & rule <= 4 )
    [ grid_index, grid_base ] = levels_index_ofn ( dim_num, level_max, ...
      point_num );
  elseif ( 5 <= rule & rule <= 6 )
    [ grid_index, grid_base ] = levels_index_own ( dim_num, level_max, ...
      point_num );
  elseif ( 7 == rule )
    [ grid_index, grid_base ] = levels_index_onn ( dim_num, level_max, ...
      point_num );
  else
    grid_index = [];
    grid_base = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEVELS_INDEX - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized rule number = %d\n', rule );
    error ( 'LEVELS_INDEX - Fatal error!' );
  end

  return
end
