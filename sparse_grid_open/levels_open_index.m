function grid_index = levels_open_index ( dim_num, level_max, point_num )

%*****************************************************************************80
%
%% LEVELS_OPEN_INDEX computes open grids with 0 <= LEVEL <= LEVEL_MAX.
%
%  Discussion:
%
%    The necessary dimension of GRID_INDEX can be
%    determined by calling LEVELS_OPEN_INDEX_SIZE first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2008
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
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of point indices,
%    representing a subset of the product grid of level LEVEL_MAX,
%    representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%

%
%  Outer loop generates LEVEL's from 0 to LEVEL_MAX.
%
  point_num2 = 0;

  for level = 0 : level_max
%
%  The middle loop generates the next partition, LEVEL_1D(1:DIM_NUM),
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
      order_1d = level_to_order_open ( dim_num, level_1d );
%
%  The product of the 1D orders gives us the number of points in this grid.
%
      order_nd = prod ( order_1d(1:dim_num) );
%
%  The inner (hidden) loop generates all points corresponding to given grid.
%
      grid_index2 = multigrid_index1 ( dim_num, order_1d, order_nd );
%
%  Only keep those points which first appear on this level.
%  If you keep a point, it is necessary to rescale each of its components
%  so that we save the coordinates as they apply on the final grid.
%
      for point = 1 : order_nd

        if ( all ( mod ( grid_index2(1:dim_num,point), 2 ) == 1 ) )

          point_num2 = point_num2 + 1;

          for dim = 1 : dim_num
            grid_index(dim,point_num2) = ...
              2^( level_max - level_1d(dim) ) * grid_index2(dim,point);
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
