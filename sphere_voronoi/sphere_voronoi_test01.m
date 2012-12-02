function sphere_voronoi_test01 ( )

%*****************************************************************************80
%
%% SPHERE_VORONOI_TEST01 demonstrates the computation of a Voronoi diagram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_VORONOI_TEST01\n' );
  fprintf ( 1, '  Demonstrate the computation of a Voronoi diagram\n' );
  fprintf ( 1, '  on a sphere.\n' );
%
%  Choose a random set of "Delaunay" points on the unit sphere.
%
  n = 10;
  seed = 123456789;
  [ d_xyz, seed ] = uniform_on_sphere01_map ( 3, n, seed );
  r8mat_transpose_print ( 3, n, d_xyz, '  Delaunay points:' );
%
%  Compute the Delaunay triangulation.
%
  [ face_num, face ] = sphere_delaunay ( n, d_xyz );
  i4mat_transpose_print ( 3, face_num, face, '  Delaunay vertices:' );
%
%  Compute the Delaunay triangle neighbor array.
%
  face_neighbors = triangulation_neighbor_triangles ( 3, face_num, face );
  i4mat_transpose_print ( 3, face_num, face_neighbors, '  Delaunay neighbors:' );
%
%  For each Delaunay triangle, compute the normal vector, to get the 
%  Voronoi vertex.
%
  v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
  r8mat_transpose_print ( 3, face_num, v_xyz , '  Voronoi vertices' );
%
%  Compute the order of each Voronoi polygon.
%
  order = voronoi_order ( n, face_num, face );
  i4vec_print ( n, order, '  Voronoi orders:' );
%
%  Compute the Voronoi vertex lists that define the Voronoi polygons.
%
  [ first, list ] = voronoi_polygons ( n, face_num, face );
  list_num = 2 * face_num;
  i4list_print ( n, first, list_num, list, '  Voronoi polygons:' );
%
%  Compute the areas of the Voronoi polygons.
%
  v_num = face_num;
  area = voronoi_areas ( n, first, list_num, list, d_xyz, v_num, v_xyz );
  r8vec_print ( n, area, '  Voronoi areas:' );
%
%  Compute the centroids of the polygons.
%
  centroid = voronoi_centroids ( n, first, list_num, list, d_xyz, v_num, v_xyz );
  r8mat_transpose_print ( 3, n, centroid, '  Voronoi centroids' );

  return
end
