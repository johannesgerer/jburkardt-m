function node_xyz = bezier_surface_node_read ( node_file_name, node_num )

%*****************************************************************************80
%
%% BEZIER_SURFACE_NODE_READ reads nodes from a node file.
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
%    Output, real NODE_XYZ(3,NODE_NUM), the coordinates of the
%    nodes.
%
  dim_num = 3;

  node_xyz = r8mat_data_read ( node_file_name, dim_num, node_num );

  return
end
