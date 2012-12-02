function [ grid_weight, grid_point ] = sparse_grid_ofn ( dim_num, ...
  level_max, rule, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_OFN computes a sparse grid based on an OFN 1D rule.
%
%  Discussion:
%
%    The 1D quadrature rule is assumed to be Open Fully Nested.
%
%    Open Fully Nested rules include Fejer 1, Fejer 2, and Gauss Patterson rules.
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
%    31 March 2008
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
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), the points.
%
  if ( rule < 2 | 4 < rule )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPARSE_GRID_OFN - Fatal error!' );
    fprintf ( 1, '  Illegal input rule index = %d\n', rule );
    error ( 'SPARSE_GRID_OFN - Fatal error!' );
  end
%
%  Determine the index vector, relative to the full product grid,
%  that identifies the points in the sparse grid.
%
  [ grid_index, grid_base ] = levels_index_ofn ( dim_num, level_max, point_num );
%
%  Compute the physical coordinates of the abscissas.
%
  order_max = 2^( level_max + 1 ) - 1;

  grid_point = zeros ( dim_num, point_num );

  for point = 1 : point_num
    for dim = 1 : dim_num

      if ( rule == 2 )
        grid_point(dim,point) = ...
          f1_abscissa ( order_max, grid_index(dim,point) );
      elseif ( rule == 3 )
        grid_point(dim,point) = ...
          f2_abscissa ( order_max, grid_index(dim,point) );
      elseif ( rule == 4 )
        grid_point(dim,point) = ...
          gp_abscissa ( order_max, grid_index(dim,point) );
      end

    end
  end
%
%  Gather the weights.
%
  grid_weight = sparse_grid_weights_ofn ( dim_num, level_max, rule, ...
    point_num, grid_index );

  return
end
