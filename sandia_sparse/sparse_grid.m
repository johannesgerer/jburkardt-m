function [ grid_weight, grid_point ] = sparse_grid ( dim_num, level_max, ...
  rule, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID computes a sparse grid.
%
%  Discussion:
%
%    A Smolyak construction is used to create a multidimensional sparse grid.
%
%    The user specifies:
%    * the spatial dimension of the quadrature region,
%    * the level that defines the Smolyak grid.
%    * the 1D quadrature rule.
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
%    Input, integer LEVEL_MAX, controls the size of the final
%    sparse grid.
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
%    Input, integer POINT_NUM, the number of points in the grid,
%    as determined by LEVELS_INDEX_SIZE.
%
%    Output, real GRID_WEIGHT(POINT_NUM), the weights.
%
%    Output, real  GRID_POINT(DIM_NUM,POINT_NUM), the points.
%
  if ( rule == 1 )
    [ grid_weight, grid_point ] = sparse_grid_cfn ( dim_num, level_max, ...
      rule, point_num );
  elseif ( 2 <= rule & rule <= 4 )
    [ grid_weight, grid_point ] = sparse_grid_ofn ( dim_num, level_max, ...
      rule, point_num );
  elseif ( 5 <= rule & rule <= 6 )
    [ grid_weight, grid_point ] = sparse_grid_own ( dim_num, level_max, ...
      rule, point_num );
  elseif ( 7 == rule ) 
    [ grid_weight, grid_point ] = sparse_grid_onn ( dim_num, level_max, ...
      rule, point_num );
  else
    grid_weight = [];
    grid_point = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPARSE_GRID - Fatal error!\n' );
    fprintf ( 1, '  Illegal input rule index = %d\n', rule );
    error ( 'SPARSE_GRID - Fatal error!' );
  end

  return
end
