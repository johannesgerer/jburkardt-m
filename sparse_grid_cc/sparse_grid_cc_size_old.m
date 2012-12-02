function point_num = sparse_grid_cc_size_old ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_SIZE_OLD sizes a sparse grid of Clenshaw Curtis points.
%
%  Discussion:
%
%    This function has been replaced by a much faster version.
%
%    It is retained for historical interest only.
%
%    The grid is defined as the sum of the product rules whose LEVEL
%    satisfies:
%
%      0 <= LEVEL <= LEVEL_MAX.
%
%    This routine works on an abstract set of nested grids.  
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
%    Output, integer POINT_NUM, the total number of unique points in the grids.
%

%
%  Special case.
%
  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  The outer loop generates LEVELs from 0 to LEVEL_MAX.
%
  point_num = 0;

  for level = 0 : level_max
%
%  The middle loop generates the next partition that adds up to LEVEL.
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
%  The inner (hidden) loop generates all points corresponding to given grid.
%
      grid_index = multigrid_index0 ( dim_num, order_1d, order_nd );
%
%  Adjust these grid indices to reflect LEVEL_MAX.
%
      grid_index = multigrid_scale_closed ( dim_num, order_nd, level_max, ...
        level_1d, grid_index );
%
%  Determine the first level of appearance of each of the points.
%
      grid_level = abscissa_level_closed_nd ( level_max, dim_num, order_nd, ...
        grid_index );
%
%  Only keep those points which first appear on this level.
%
      for point = 1 : order_nd

        if ( grid_level(point) == level )

          point_num = point_num + 1;

        end

      end

      if ( ~more )
        break
      end

    end

  end

  return
end
