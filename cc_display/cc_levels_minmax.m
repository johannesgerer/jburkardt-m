function [ grid_level, grid_order, grid_point ] = cc_levels_minmax ( ...
  dim_num, level_min, level_max, grid_num, point_num )

%*****************************************************************************80
%
%% CC_LEVELS_MINMAX computes CC grids with LEVEL_MIN <= LEVEL <= LEVEL_MAX.
%
%  Discussion:
%
%    The CC grids are required to have an order that is 2**LEVEL + 1.
%
%    The necessary dimensions of GRID_LEVEL, GRID_ORDER and GRID_POINT can be
%    determined by calling CC_LEVELS_MINMAX first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MIN, LEVEL_MAX, the minimum and maximum values of
%    LEVEL.
%
%    Input, integer GRID_NUM, the number of Clenshaw Curtis
%    grids whose LEVEL value is between LEVEL_MIN and LEVEL_MAX.
%
%    Input, integer POINT_NUM, the total number of points in the grids.
%
%    Output, integer GRID_LEVEL(DIM_NUM,GRID_NUM), contains, for each
%    grid, the level of the Clenshaw-Curtis rule in each dimension.
%
%    Output, integer GRID_ORDER(DIM_NUM,GRID_NUM), contains, for each
%    grid, the order of the Clenshaw-Curtis rule in each dimension.
%
%    Output, real GRID_POINT(DIM_NUM,POINT_NUM), contains
%    a list of all the abscissas of all the rules, listed one grid at
%    a time.  If a point occurs in several grids, it will be listed
%    several times.
%

%
%  Outer loop generates LEVEL's from LEVEL_MIN to LEVEL_MAX.
%
  point_num = 0;
  grid_num = 0;

  for level = level_min : level_max
%
%  Middle loop generates next partition that adds up to LEVEL.
%
    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );
%
%  Inner (hidden) loop generates all CC points corresponding to given grid.
%
      order_1d = cc_level_to_order ( dim_num, level_1d );

      order_nd = prod ( order_1d(1:dim_num) );

      grid_point(1:dim_num,point_num+1:point_num+order_nd) = cc_grid ( ...
        dim_num, order_1d, order_nd );

      point_num = point_num + order_nd;

      grid_num = grid_num + 1;
      grid_level(1:dim_num,grid_num) = level_1d(1:dim_num);
      grid_order(1:dim_num,grid_num) = order_1d(1:dim_num);

      if ( ~more )
        break
      end

    end

  end

  return
end
