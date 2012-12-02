function point_num = sparse_grid_herm_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_HERM_SIZE sizes a sparse grid of Gauss-Hermite points.
%
%  Discussion:
%
%    The grid is defined as the sum of the product rules whose LEVEL
%    satisfies:
%
%      LEVEL_MIN <= LEVEL <= LEVEL_MAX.
%
%    where LEVEL_MAX is user specified, and 
%
%      LEVEL_MIN = max ( 0, LEVEL_MAX + 1 - DIM_NUM ).
%
%    The grids are only very weakly nested, since Gauss-Hermite rules
%    only have the origin in common.
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
%    Output, integer POINT_NUM, the number of points in the grid.
%

%
%  Special case.
%
  if ( level_max == 0 )
    point_num = 1;
    return;
  end
%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
  point_num = 0;

  level_min = max ( 0, level_max + 1 - dim_num );
  
  for level = level_min : level_max
%
%  The middle loop generates the next partition that adds up to LEVEL.
%
    level_1d = [];
    more = false;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Transform each 1D level to a corresponding 1D order.
%
      order_1d = level_to_order_open ( dim_num, level_1d );

      for dim = 1 : dim_num
%
%  If we can reduce the level in this dimension by 1 and
%  still not go below LEVEL_MIN.
%
        if ( level_min < level & 1 < order_1d(dim) )
          order_1d(dim) = order_1d(dim) - 1;
        end
		
      end

      point_num = point_num + prod ( order_1d(1:dim_num) );

      if ( ~more )
        break
      end
	  
    end
  end

  return
end
