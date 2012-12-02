function next = next_boundary_node_t10 ( node )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE_T10 returns the next boundary node in a T10 element.
%
%  Reference Element T10:
%
%    |
%    1  10
%    |  |\
%    |  | \
%    |  8  9
%    |  |   \
%    S  |    \
%    |  5  6  7
%    |  |      \
%    |  |       \
%    0  1--2--3--4
%    |
%    +--0----R---1-->
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
    next = 4;
  elseif ( node == 4 )
    next = 7;
  elseif ( node == 7 )
    next = 9;
  elseif ( node == 9 )
    next = 10;
  elseif ( node == 10 )
    next = 8;
  elseif ( node == 8 )
    next = 5;
  else
    next = 1;
  end

  return
end
