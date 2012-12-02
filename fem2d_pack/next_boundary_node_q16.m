function next = next_boundary_node_q16 ( node )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE_Q16 returns the next boundary node in a Q16 element.
%
%  Reference Element Q16:
%
%    |
%    1 13--14--15--16
%    |  |   :   :   |
%    |  |   :   :   |
%    |  9..10..11..12
%    S  |   :   :   |
%    |  |   :   :   |
%    |  5...6...7...8
%    |  |   :   :   |
%    |  |   :   :   |
%    0  1---2---3---4
%    |
%    +--0-----R-----1-->
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
    next = 8;
  elseif ( node == 8 )
    next = 12;
  elseif ( node == 12 )
    next = 16;
  elseif ( node == 16 )
    next = 15;
  elseif ( node == 15 )
    next = 14;
  elseif ( node == 14 )
    next = 13;
  elseif ( node == 13 )
    next = 9;
  elseif ( node == 9 )
    next = 5;
  else
    next = 1;
  end

  return
end
