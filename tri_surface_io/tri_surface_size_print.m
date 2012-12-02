function tri_surface_size_print ( node_file_name, triangle_file_name, dim_num, ...
  node_num, order_num, triangle_num )

%*****************************************************************************80
%
%% TRI_SURFACE_SIZE_PRINT prints sizes associated with a TRI_SURFACE file.
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
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ORDER_NUM, the order of the triangles.
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRI_SURFACE_SIZE_PRINT:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node file     "%s".\n', node_file_name );
  fprintf ( 1, '  Triangle file "%s".\n', triangle_file_name );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension  = %d\n', dim_num );
  fprintf ( 1, '  Nodes              = %d\n', node_num );
  fprintf ( 1, '  Triangle order     = %d\n', order_num );
  fprintf ( 1, '  Triangles          = %d\n', triangle_num );

  return
end
