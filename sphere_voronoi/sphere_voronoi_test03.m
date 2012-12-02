function sphere_voronoi_test03 ( )

%*****************************************************************************80
%
%% SPHERE_VORONOI_TEST03 demonstrates the computation of a Voronoi diagram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_VORONOI_TEST03\n' );
  fprintf ( 1, '  For a Voronoi diagram on a sphere, compute the\n' );
  fprintf ( 1, '  area of each Voronoi polygon two ways and\n' );
  fprintf ( 1, '  compare the results:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1: by building the polygons from triangles,\n' );
  fprintf ( 1, '     the computing areas;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  2: by dividing each triangle among the Voronoi centers.\n' );
%
%  Choose a random set of "Delaunay" points on the unit sphere.
%
  n = 10;
  seed = 123456789;
  [ d_xyz, seed ] = uniform_on_sphere01_map ( 3, n, seed );

  if ( 0 )
    r8mat_transpose_print ( 3, n, d_xyz, '  Delaunay points:' );
  end
%
%  Compute the Delaunay triangulation.
%
  [ face_num, face ] = sphere_delaunay ( n, d_xyz );

  if ( 0 )
    i4mat_transpose_print ( 3, face_num, face, '  Delaunay vertices:' );
  end
%
%  Compute the Delaunay triangle neighbor array.
%
  face_neighbors = triangulation_neighbor_triangles ( 3, face_num, face );
  if ( 0 )
    i4mat_transpose_print ( 3, face_num, face_neighbors, '  Delaunay neighbors:' );
  end
%
%  For each Delaunay triangle, compute the normal vector, to get the 
%  Voronoi vertex.
%
  v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
  if ( 1 )
    r8mat_transpose_print ( 3, face_num, v_xyz , '  Voronoi vertices' );
  end
%
%  Compute the order of each Voronoi polygon.
%
  if ( 0 )
    order = voronoi_order ( n, face_num, face );
    i4vec_print ( n, order, '  Voronoi orders:' );
  end
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
  area1 = voronoi_areas ( n, first, list_num, list, d_xyz, v_num, v_xyz );
%
%  Compute the centroids of the Voronoi polygons.
%
  centroid1 = voronoi_centroids ( n, first, list_num, list, d_xyz, v_num, v_xyz );
%
%  Compute areas directly.
%
  [ area2, centroid2 ] = voronoi_data ( n, d_xyz, face_num, face, v_xyz );
%
%  Compare areas:
%
  r8vec_print ( n, area1, '  Voronoi areas, method 1:' );
  r8vec_print ( n, area2, '  Voronoi areas, method 2:' );
%
%  Compare centroids:
%
  r8mat_transpose_print ( 3, n, centroid1, '  Voronoi centroids, method 1' );
  r8mat_transpose_print ( 3, n, centroid2, '  Voronoi centroids, method 2' );

  return
end
