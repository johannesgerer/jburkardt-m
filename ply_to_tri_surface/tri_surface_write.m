function tri_surface_write ( node_file_name, triangle_file_name, dim_num, ...
  node_num, order_num, triangle_num, node_xyz, triangle_node )

%*****************************************************************************80
%
%% TRI_SURFACE_WRITE writes graphics information to a pair of TRI_SURFACE files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the triangle file.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer ORDER_NUM, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, real NODE_XYZ(DIM_NUM,NODE_NUM), the node coordinates.
%
%    Input, integer TRIANGLE_NODE(ORDER_NUM,TRIANGLE_NUM), 
%    the nodes that form the triangles.
%
  r8mat_write ( node_file_name, dim_num, node_num, node_xyz );

  i4mat_write ( triangle_file_name, order_num, triangle_num, ...
    triangle_node );

  return
end
