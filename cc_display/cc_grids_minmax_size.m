function [ grid_num, point_num ] = cc_grids_minmax_size ( dim_num, q_min, ...
  q_max )

%*****************************************************************************80
%
%% CC_GRIDS_MINMAX_SIZE returns sizes for the CC_GRIDS_MINMAX.
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
%    12 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer Q_MIN, Q_MAX, the minimum and maximum values of
%    Q, the sum of the orders in each spatial coordinate.
%
%    Output, integer GRID_NUM, the number of Clenshaw Curtis
%    grids whose Q value is between Q_MIN and Q_MAX.
%
%    Output, integer POINT_NUM, the total number of points in the grids.
%

%
%  Determine the total number of points that will be generated
%  by "going through the motions".
%
  point_num = 0;
  grid_num = 0;

  for q = q_min : q_max

    more = 0;
    order_1d = [];

    while ( 1 )

      [ order_1d, more ] = compnz_next ( q, dim_num, order_1d, more );

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
