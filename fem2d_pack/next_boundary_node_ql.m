function next = next_boundary_node_ql ( node )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE_QL returns the next boundary node in a QL element.
%
%  Reference Element QL:
%
%    |
%    1  4---5---6
%    |  |       |
%    |  |       |
%    S  |       |
%    |  |       |
%    |  |       |
%    0  1---2---3
%    |
%    +--0---R---1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE, the index of the current node.  An input
%    value of 0 (or any "unusual" value") indicates that the
%    first edge node is desired.
%
%    Output, integer NEXT, the index of the next edge node.
%
  if ( node == 1 )
    next = 2;
  elseif ( node == 2 )
    next = 3;
  elseif ( node == 3 )
    next = 6;
  elseif ( node == 6 )
    next = 5;
  elseif ( node == 5 )
    next = 4;
  else
    next = 1;
  end

  return
end
