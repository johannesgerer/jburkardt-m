function mask = triangle_mask ( dim_num, triangle_order, nodes, coord )

%*****************************************************************************80
%
%% TRIANGLE_MASK is a user routine which masks triangles.
%
%  Discussion:
%
%    The region to be considered is the union of two rectangles.
%    The first is  -8 <= X <= 2, -1 <= Y <= 0,
%    the second is -2 <= X <= 8,  0 <= Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer TRIANGLE_ORDER, the number of nodes in the triangle.
%
%    Input, integer NODES(TRIANGLE_ORDER), the indices of the nodes.
%
%    Input, real COORD(DIM_NUM,TRIANGLE_ORDER), the coordinates
%    of the nodes.
%
%    Output, logical MASK, is TRUE if the triangle should be discarded,
%    and FALSE if the triangle should be retained.
%

%
%  Compute the centroid.
%
  for dim = 1 : dim_num
    centroid(dim) = sum ( coord(dim,1:triangle_order) ) / triangle_order;
  end
%
%  MASK = The centroid is outside the region.
%
  if ( -8.0 <= centroid(1) & centroid(1) <= 2.0 & ...
       -1.0 <= centroid(2) & centroid(2) <= 0.0 )

    mask = 0;

  elseif ( -2.0 <= centroid(1) & centroid(1) <= 8.0 & ...
            0.0 <= centroid(2) & centroid(2) <= 1.0 ) 

    mask = 0;

  else

    mask = 1;

  end

  return
end
