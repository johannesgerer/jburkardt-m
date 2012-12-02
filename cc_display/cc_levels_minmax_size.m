function [ grid_num, point_num ] = cc_levels_minmax_size ( dim_num, ...
  level_min, level_max )

%*****************************************************************************80
%
%% CC_LEVELS_MINMAX_SIZE returns sizes for CC_LEVELS_MINMAX.
%
%  Discussion:
%
%    This routine can be used to determine the necessary size to be
%    allocated to arrays GRID_ORDER and GRID_POINT in a call to
%    CC_GRIDS_MINMAX.
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
%    LEVEL, the sum of the levels in each spatial coordinate.
%
%    Output, integer GRID_NUM, the number of Clenshaw Curtis
%    grids whose LEVEL value is between LEVEL_MIN and LEVEL_MAX.
%
%    Output, integer POINT_NUM, the total number of points in the grids.
%

%
%  Determine the total number of points that will be generated
%  by "going through the motions".
%
  point_num = 0;
  grid_num = 0;

  for level = level_min : level_max

    level_1d = [];
    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );

      order_1d = cc_level_to_order ( dim_num, level_1d );

      order_nd = prod ( order_1d(1:dim_num) );

      point_num = point_num + order_nd;

      grid_num = grid_num + 1;

      if ( ~more )
        break
      end

    end

  end

  return
end
