function next = next_boundary_node_q8 ( node )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE_Q8 returns the next boundary node in a Q8 element.
%
%  Reference Element Q8:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8     6
%    |  |     |
%    |  |     |
%    0  1--5--2
%    |
%    +--0--R--1-->
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
    next = 5;
  elseif ( node == 5 )
    next = 2;
  elseif ( node == 2 )
    next = 6;
  elseif ( node == 6 )
    next = 3;
  elseif ( node == 3 )
    next = 7;
  elseif ( node == 7 )
    next = 4;
  elseif ( node == 4 )
    next = 8;
  else
    next = 1;
  end

  return
end
