function [ grid_num, point_num ] = cc_grids_constrained_size ( dim_num, ...
  q_max, alpha, order_min, order_max )

%*****************************************************************************80
%
%% CC_GRIDS_CONSTRAINED_SIZE computes CC orders and grids with a constraint.
%
%  Discussion:
%
%    The constraint on the order of the 1D Clenshaw Curtis rule in 
%    spatial dimension I is:
%
%      ORDER_MIN(I) <= ORDER(I) <= ORDER_MAX(I) 
%
%    The constraint on the collection of orders making up a rule is:
%
%      Sum ( 1 <= I <= DIM_NUM ) ALPHA(I) * ORDER(I) <= Q_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real Q_MAX, the maximum values of
%    Q, the sum of the weighted orders in each spatial coordinate.
%
%    Input, real ALPHA(DIM_NUM), the weight factors for
%    the orders in each spatial dimension.
%
%    Input, integer ORDER_MIN(DIM_NUM), ORDER_MAX(DIM_NUM), the minimum
%    and maximum values of the order of the 1D Clenshaw Curtis rule
%    in each spatial dimension.
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

  order_1d = [];
  more = 0;

  while ( 1 )

    [ order_1d, more ] = vector_constrained_next4 ( dim_num, alpha, ...
      order_min, order_max, order_1d, q_max, more );

    if ( ~more )
      break
    end

    order_nd = prod ( order_1d(1:dim_num) );

    point_num = point_num + order_nd;

    grid_num = grid_num + 1;

  end

  return
end
