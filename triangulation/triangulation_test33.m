function triangulation_test33 ( )

%*****************************************************************************80
%
%% TEST33 tests VORONOI_POLYGON_VERTICES.
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
  dim_num = 2;
  neighbor_num = 4;
  node_num = 5;

  center = 5;
  neighbor_index = [ 1, 2, 3, 4 ];
  node_xy = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 1.0; ...
    0.0, 1.0; ...
    0.5, 0.5 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST33\n' );
  fprintf ( 1, '  VORONOI_POLYGON_VERTICES computes the vertices of\n' );
  fprintf ( 1, '  a finite Voronoi polygon.\n' );

  v = voronoi_polygon_vertices ( center, neighbor_num, neighbor_index, ...
    node_num, node_xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Voronoi Polygon Vertex coordinates:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : neighbor_num
    fprintf ( 1, '  %4d  %14f  %14f\n', i, v(1:2,i) );
  end

  return
end
