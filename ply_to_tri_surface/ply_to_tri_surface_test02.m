function ply_to_tri_surface_test02 ( ply_file_name )

%*****************************************************************************80
%
%% TEST02 tests TRI_SURFACE_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PLY_TO_TRI_SURFACE reads a PLY file as TRI_SURFACE data.\n' );
  fprintf ( 1, '  TRI_SURFACE_WRITE writes the data to a pair of TRI_SURFACE files.\n' );
%
%  Read PLY data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Extract nodes and triangles from "%s"\n', ply_file_name );

  [ node_xyz, triangle_node ] = ply_to_tri_surface ( ply_file_name );
%
%  Get sizes of the data.
%
  [ dim_num, node_num ] = size ( node_xyz );
  [ order_num, triangle_num ] = size ( triangle_node );
%
%  Print some of the data.
%
   r8mat_transpose_print_some ( dim_num, node_num, node_xyz, ...
     1, 1, dim_num, 5, '  The first 5 nodes:' );

   triangle_num = size ( triangle_node, 2 );

   i4mat_transpose_print_some ( order_num, triangle_num, triangle_node, ...
     1, 1, order_num, 5, '  The first 5 triangles.' );
%
%  Write data to TRI_SURFACE files.
%
  node_file_name = 'cube_nodes.txt';
  triangle_file_name = 'cube_elements.txt';

  tri_surface_write ( node_file_name, triangle_file_name, dim_num, ...
    node_num, order_num, triangle_num, node_xyz, triangle_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics data written in TRI_SURFACE format to:\n' );
  fprintf ( 1, '  node file     = "%s".\n', node_file_name );
  fprintf ( 1, '  triangle file = "%s".\n', triangle_file_name );

  return
end
