function point_num = levels_index_size_own ( dim_num, level_max )

%*****************************************************************************80
%
%% LEVELS_INDEX_SIZE_OWN sizes a sparse grid made from OWN 1D rules.
%
%  Discussion:
%
%    The sparse grid is presumed to have been created from products
%    of OPEN WEAKLY NESTED 1D quadrature rules.
%
%    OWN rules include Gauss Hermite and Gauss Legendre.
%
%    The sparse grid is the logical sum of product grids with total LEVEL
%    between LEVEL_MIN and LEVEL_MAX.
%
%    Oddly enough, in order to count the number of points, we will
%    behave as though LEVEL_MIN was zero.  This is because our computation
%    concentrates on throwing away all points generated at lower levels,
%    but, in fact, if we start at a nonzero level, we need to include
%    on that level all the points that would have been generated on lower
%    levels.
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
%    Output, integer POINT_NUM, the number of points in the grid.
%

%  Special case.
%
  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  The outer loop generates LEVELs from LEVEL_MIN to LEVEL_MAX.
%
%  The normal definition of LEVEL_MIN:
%
%   level_min = max ( 0, level_max + 1 - dim_num )
%
%  Our somewhat artificial temporary local definition of LEVEL_MIN:
%
  if ( dim_num == 1 )
    level_min = level_max;
    point_num = 1;
  else
    level_min = 0;
    point_num = 0;
  end

  for level = level_min : level_max
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
      order_1d = level_to_order_open ( dim_num, level_1d );

      for dim = 1 : dim_num
%
%  Account for the repetition of the center point.
%
        if ( 1 < order_1d(dim) )
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
