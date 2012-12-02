function grid_weight = sparse_grid_cc_weights ( dim_num, level_max, point_num, ...
  grid_index )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_WEIGHTS gathers the weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2008
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
%    Input, integer POINT_NUM, the total number of points in the grids.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of point indices,
%    representing a subset of the product grid of level LEVEL_MAX,
%    representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%
%    Output, real GRID_WEIGHT(POINT_NUM), the weights
%    associated with the sparse grid points.
%
  if ( level_max == 0 )
    grid_weight(1:point_num) = 2.0^dim_num;
    return
  end

  grid_weight(1:point_num) = 0.0;

  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max
%
%  The middle loop generates the next partition LEVEL_1D(1:DIM_NUM)
%  that adds up to LEVEL.
%
    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_closed ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  Generate the indices of the points corresponding to the grid.
%
      grid_index2 = multigrid_index0 ( dim_num, order_1d, order_nd );
%
%  Compute the weights for this grid.
%
      grid_weight2 = product_weights_cc ( dim_num, order_1d, order_nd );
%
%  Adjust the grid indices to reflect LEVEL_MAX.
%
      grid_index2 = multigrid_scale_closed ( dim_num, order_nd, level_max, ...
        level_1d, grid_index2 );
%
%  Now determine the coefficient.
%
      coeff = (-1)^( level_max - level ) ...
        * i4_choose ( dim_num - 1, level_max - level );

      for point2 = 1 : order_nd

        for point = 1 : point_num

          if ( all ( ...
            grid_index2(1:dim_num,point2) == grid_index(1:dim_num,point) ...
          ) )
            grid_weight(point) = grid_weight(point) ...
              + coeff * grid_weight2(point2);
            break
          end

        end

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
