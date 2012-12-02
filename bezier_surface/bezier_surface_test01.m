function bezier_surface_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests routines to read a Bezier surface definition.
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
  node_file_name = 'teapot_nodes.txt';
  rectangle_file_name = 'teapot_rectangles.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  BEZIER_SURFACE_NODE_SIZE determines the number of\n' );
  fprintf ( 1, '    nodes in a Bezier surface node file.\n' );
  fprintf ( 1, '  BEZIER_SURFACE_NODE_READ reads the\n' );
  fprintf ( 1, '    nodes in a Bezier surface node file.\n' );
  fprintf ( 1, '  BEZIER_SURFACE_RECTANGLES_SIZE determines the number of\n' );
  fprintf ( 1, '    rectangles in a Bezier surface rectangle file.\n' );
  fprintf ( 1, '  BEZIER_SURFACE_RECTANGLES_READ reads the\n' );
  fprintf ( 1, '    rectangles in a Bezier surface rectangle file.\n' );
%
%  Get the number of nodes, allocate space for them, and read them in.
%
  node_num = bezier_surface_node_size ( node_file_name );
  node_xyz = bezier_surface_node_read ( node_file_name, node_num );
  bezier_surface_node_print ( node_num, node_xyz );
%
%  Get the number of rectangles, allocate space for them, and read them in.
%
  rectangle_num = bezier_surface_rectangle_size ( rectangle_file_name );
  rectangle_node = bezier_surface_rectangle_read ( rectangle_file_name, ...
    rectangle_num );
  bezier_surface_rectangle_print ( rectangle_num, rectangle_node );

  return
end
