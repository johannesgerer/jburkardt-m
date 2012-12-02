function mask = triangle_mask ( dim_num, triangle_order, nodes, coord )

%*****************************************************************************80
%
%% TRIANGLE_MASK is a user routine which masks triangles.
%
%  Discussion:
%
%    The region to be considered is the [0,4]x[0,4] square.
%
%    We want to remove the lower left triangular corner,
%    and part of the upper right triangular corner.
%
%    The following diagram of the 25 nodes indicates by "O" the
%    nodes that should end up being deleted, although the deletion
%    is actually done by triangles.
%
%    Before masking:
%
%      X - X - X - X - X
%      | \ | \ | \ | \ |
%      X - X - X - X - X
%      | \ | \ | \ | \ |
%      X - X - X - X - X
%      | \ | \ | \ | \ |
%      X - X - X - X - X
%      | \ | \ | \ | \ |
%      X - X - X - X - X
%
%    After masking:
%
%      X - X   O   O   O
%      | \ | \          
%      X - X - X   O   O
%      | \ | \ | \      
%      X - X - X - X - X
%        \ | \ | \ | \ |
%      O   X - X - X - X
%            \ | \ | \ |
%      O   O   X - X - X
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
%  Remove the lower left corner
%
  if ( centroid(1) + centroid(2) < 2.0 )

    mask = 1;
%
%  Remove the upper right section.
%
  elseif ( 5.0 < centroid(1) + centroid(2) & 2.0 < centroid(2) )

    mask = 1;
%
%  Keep everything else.
%
  else

    mask = 0;

  end

  return
end
