function value = box_01_contains_point_nd ( dim_num, p )

%*****************************************************************************80
%
%% BOX_01_CONTAINS_POINT_ND determines if a point is inside a unit box in ND.
%
%  Discussion:
%
%    A unit box is assumed to be a rectangle with sides aligned on coordinate
%    axes.  It can be described by its low and high corner, P1 and P2:
%
%      0 <= P(1:DIM_NUM) <= 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real P(DIM_NUM), the point to be checked.
%
%    Output, logical VALUE, is TRUE if P is inside the box.
%
  value = 0;

  for i = 1 : dim_num
    if ( p(i) < 0.0 | 1.0 < p(i) )
      return
    end
  end

  value = 1;

  return
end
