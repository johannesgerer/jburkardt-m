function node_num = grid_node_num ( code, nelemx, nelemy )

%*****************************************************************************80
%
%% GRID_NODE_NUM returns the number of nodes in a grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element desired.
%    Legal values include 'Q4', 'Q8', 'Q9', 'Q12', 'Q16', 'QL', 'T3', 
%    'T4', 'T6' and 'T10'.
%
%    Input, integer NELEMX, NELEMY, the number of quadrilaterals along the
%    X and Y directions.  
%
%    Output, integer NODE_NUM, the number of elements in the grid.
%
  if ( s_eqi ( code, 'Q4' ) )
    node_num = grid_q4_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q8' ) )
    node_num = grid_q8_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q9' ) )
    node_num = grid_q9_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q12' ) )
    node_num = grid_q12_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q16' ) )
    node_num = grid_q16_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'QL' ) )
    node_num = grid_ql_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T3' ) )
    node_num = grid_t3_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T4' ) )
    node_num = grid_t4_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T6' ) )
    node_num = grid_t6_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T10' ) )
    node_num = grid_t10_node_num ( nelemx, nelemy );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRID_NODE_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s".', code );
    node_num = -1;
    error ( 'GRID_NODE_NUM - Fatal error!' );
  end

  return
end
