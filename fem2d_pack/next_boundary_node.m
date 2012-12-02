function next = next_boundary_node ( node, code )

%*****************************************************************************80
%
%% NEXT_BOUNDARY_NODE returns the next boundary node in any element.
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
  if ( s_eqi ( code, 'Q4' ) )
    next = next_boundary_node_q4 ( node );
  elseif ( s_eqi ( code, 'Q8' ) )
    next = next_boundary_node_q8 ( node );
  elseif ( s_eqi ( code, 'Q9' ) )
    next = next_boundary_node_q9 ( node );
  elseif ( s_eqi ( code, 'Q12' ) )
    next = next_boundary_node_q12 ( node );
  elseif ( s_eqi ( code, 'Q16' ) )
    next = next_boundary_node_q16 ( node );
  elseif ( s_eqi ( code, 'QL' ) )
    next = next_boundary_node_ql ( node );
  elseif ( s_eqi ( code, 'T3' ) )
    next = next_boundary_node_t3 ( node );
  elseif ( s_eqi ( code, 'T4' ) )
    next = next_boundary_node_t4 ( node );
  elseif ( s_eqi ( code, 'T6' ) )
    next = next_boundary_node_t6 ( node );
  elseif ( s_eqi ( code, 'T10' ) )
    next = next_boundary_node_t10 ( node );
  else
    next = -1;
  end

  return
end
