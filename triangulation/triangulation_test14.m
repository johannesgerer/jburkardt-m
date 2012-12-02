function triangulation_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests TRIANGULATION_ORDER3_BOUNDARY_EDGE_COUNT_EULER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2006
%
%  Author:
%
%    John Burkardt
%
  hole_num = 2;
  node_num = 36;
  triangle_num = 41;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  TRIANGULATION_ORDER3_BOUNDARY_EDGE_COUNT_EULER\n' );
  fprintf ( 1, '  determines the number of edges that lie on the\n' );
  fprintf ( 1, '  boundary of a region that has been triangulated.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes =          %d\n', node_num );
  fprintf ( 1, '  Number of triangles =      %d\n', triangle_num );
  fprintf ( 1, '  Number of holes =          %d\n', hole_num );

  boundary_num = triangulation_order3_boundary_edge_count_euler ( node_num, ...
    triangle_num, hole_num );

  fprintf ( 1, '  Number of boundary edges = %d\n', boundary_num );

  return
end
