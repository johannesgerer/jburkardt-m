function order = cc_level_to_order ( dim_num, level )

%*****************************************************************************80
%
%% CC_LEVEL_TO_ORDER converts a CC nesting level to a CC order.
%
%  Discussion:
%
%    Clenshaw Curtis grids can naturally be nested.  Except for the
%    first case of LEVEL = 0, the relationship is
%
%      ORDER = 2**LEVEL + 1
%
%    Nesting    Order
%    Level
%
%    0          1
%    1          3 =  2 + 1
%    2          5 =  4 + 1
%    3          9 =  8 + 1
%    4         17 = 16 + 1
%    5         33 = 32 + 1
%
%    In this routine, we assume that a vector of levels is given,!
%    and the corresponding orders are desired.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL(DIM_NUM), the nesting level.
%
%    Output, integer ORDER(DIM_NUM), the order (number of points) of the
%    Clenshaw Curtis rule.
%
  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order(dim) = -1;
    elseif ( level(dim) == 0 )
      order(dim) = 1;
    else
      order(dim) = ( 2^level(dim) ) + 1;
    end

  end

  return
end
