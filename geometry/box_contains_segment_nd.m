function value = box_contains_segment_nd ( dim_num, p1, p2, pa, pb  )

%*****************************************************************************80
%
%% BOX_CONTAINS_SEGMENT_ND reports if a box contains a line segment in ND.
%
%  Discussion:
%
%    A box is assumed to be a rectangle with sides aligned on coordinate
%    axes.  It can be described by its low and high corner, P1 and P2:
%
%      points P so that P1(1:DIM_NUM) <= P(1:DIM_NUM) <= P2(1:DIM_NUM).
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2005
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
%    Input, real PA(DIM_NUM), PB(DIM_NUM), the endpoints of the line segment.
%
%    Output, logical VALUE, is TRUE if the box contains
%    the line segment.
%
  value = 0;

  if ( ~box_contains_point_nd ( dim_num, p1, p2, pa ) )
    return
  end

  if ( ~box_contains_point_nd ( dim_num, p1, p2, pb ) )
    return
  end

  value = 1;

  return
end
