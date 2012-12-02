function node_num = sphere_grid_node_num ( code, nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_NODE_NUM returns the number of nodes in a sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string CODE, identifies the element desired.
%    Legal values include 'Q4', 'Q9', 'Q16', 'T3', 'T6'.
%
%    Input, integer NELEMX, NELEMY, the number of quadrilaterals along the
%    X and Y directions.  
%
%    Output, integer NODE_NUM, the number of elements in the grid.
%
  if ( s_eqi ( code, 'Q4' ) )
    node_num = sphere_grid_q4_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q9' ) )
    node_num = sphere_grid_q9_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'Q16' ) )
    node_num = sphere_grid_q16_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T3' ) )
    node_num = sphere_grid_t3_node_num ( nelemx, nelemy );
  elseif ( s_eqi ( code, 'T6' ) )
    node_num = sphere_grid_t6_node_num ( nelemx, nelemy );
  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_GRID_NODE_NUM - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of CODE = "%s"\n', code );
    node_num = -1;
    error ( 'SPHERE_GRID_NODE_NUM - Fatal error!' );

  end

  return
end
