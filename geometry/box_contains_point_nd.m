function value = box_contains_point_nd ( dim_num, p1, p2, p )

%*****************************************************************************80
%
%% BOX_CONTAINS_POINT_ND determines if a point is inside a box in ND.
%
%  Discussion:
%
%    A box is assumed to be a rectangle with sides aligned on coordinate
%    axes.  It can be described by its low and high corner, P1 and P2:
%
%      points P so that P1(1:DIM_NUM) <= P(1:DIM_NUM) <= P2(1:DIM_NUM).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real P1(DIM_NUM), P2(DIM_NUM), the low and high corners of the box.
%
%    Input, real P(DIM_NUM), the point to be checked.
%
%    Output, logical VALUE, is TRUE if P is inside the box.
%
  value = 0;

  for i = 1 : dim_num
    if ( p(i) < p1(i) | p2(i) < p(i) )
      return
    end
  end

  value = 1;

  return
end
