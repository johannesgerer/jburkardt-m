function bezier_surface_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests BEZIER_SURFACE_NEIGHBORS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2006
%
%  Author:
%
%    John Burkardt
%
  rectangle_file_name = 'teapot_rectangles.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  BEZIER_SURFACE_NEIGHBORS determines patch neighbors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note that, for this example, the teapot, there are\n' );
  fprintf ( 1, '  cases where more than two patches meet at a\n' );
  fprintf ( 1, '  (degenerate) side.  This routine will not handle\n' );
  fprintf ( 1, '  such cases completely.\n' );
%
%  Get the number of rectangles, allocate space for them, and read them in.
%
  rectangle_num = bezier_surface_rectangle_size ( rectangle_file_name );

  rectangle_node = bezier_surface_rectangle_read ( rectangle_file_name, ...
    rectangle_num );
%
%  Compute and print the neighbor array.
%
  rectangle_neighbor = bezier_surface_neighbors ( rectangle_num, ...
    rectangle_node );

  i4mat_transpose_print ( 4, rectangle_num, rectangle_neighbor, ...
    '  Bezier patch neighbors:' );

  return
end
