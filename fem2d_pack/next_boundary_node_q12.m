function next = next_boundary_node_q12 ( node )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE_Q12 returns the next boundary node in a Q12 element.
%
%  Reference Element Q12:
%
%    |
%    1  9-10-11-12
%    |  |        |
%    |  7        8
%    S  |        |
%    |  5        6
%    |  |        |
%    0  1--2--3--4
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
    next = 4;
  elseif ( node == 4 )
    next = 6;
  elseif ( node == 6 )
    next = 8;
  elseif ( node == 8 )
    next = 12;
  elseif ( node == 12 )
    next = 11;
  elseif ( node == 11 )
    next = 10;
  elseif ( node == 10 )
    next = 9;
  elseif ( node == 9 )
    next = 7;
  elseif ( node == 7 )
    next = 5;
  else
    next = 1;
  end

  return
end
