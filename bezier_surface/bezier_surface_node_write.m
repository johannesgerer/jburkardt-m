function bezier_surface_node_write ( node_file_name, node_num, node_xyz )

%*****************************************************************************80
%
%% BEZIER_SURFACE_NODE_WRITE writes nodes to a node file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of the
%    nodes.
%
  dim_num = 3;

  r8mat_write ( node_file_name, dim_num, node_num, node_xyz );

  return
end
