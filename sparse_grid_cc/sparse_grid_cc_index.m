function grid_index = sparse_grid_cc_index ( dim_num, level_max, point_num )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_INDEX indexes the points forming a sparse grid.
%
%  Discussion:
%
%    The points forming the sparse grid are guaranteed to be a subset
%    of a certain product grid.  The product grid is formed by DIM_NUM
%    copies of a 1D rule of fixed order.  The orders of the 1D rule,
%    (called ORDER_1D) and the order of the product grid, (called ORDER)
%    are determined from the value LEVEL_MAX.
%
%    Thus, any point in the product grid can be identified by its grid index,
%    a set of DIM_NUM indices, each between 1 and ORDER_1D.
%
%    This routine creates the GRID_INDEX array, listing (uniquely) the
%    points of the sparse grid.  
%
%    An assumption has been made that the 1D rule is closed (includes
%    the interval endpoints) and nested (points that are part of a rule
%    of a given level will be part of every rule of higher level).
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
%    Output, integer GRID_INDEX(DIM_NUM,POINT_NUM), a list of point indices,
%    representing a subset of the product grid of level LEVEL_MAX,
%    representing (exactly once) each point that will show up in a
%    sparse grid of level LEVEL_MAX.
%

%
%  The outer loop generates LEVELs from 0 to LEVEL_MAX.
%
  point_num2 = 0;

  for level = 0 : level_max
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
%  The inner (hidden) loop generates all points corresponding to given grid.
%
      grid_index2 = multigrid_index0 ( dim_num, order_1d, order_nd );
%
%  Adjust these grid indices to reflect LEVEL_MAX.
%
      grid_index2 = multigrid_scale_closed ( dim_num, order_nd, level_max, level_1d, ...
        grid_index2 );
%
%  Determine the first level of appearance of each of the points.
%
      grid_level = abscissa_level_closed_nd ( level_max, dim_num, order_nd, ....
        grid_index2 );
%
%  Only keep those points which first appear on this level.
%
      for point = 1 : order_nd

        if ( grid_level(point) == level )

          point_num2 = point_num2 + 1;

          grid_index(1:dim_num,point_num2) = grid_index2(1:dim_num,point);

        end

      end

      if ( ~more )
        break
      end

    end

  end

  return
end

