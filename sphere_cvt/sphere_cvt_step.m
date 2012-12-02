function centroid = sphere_cvt_step ( n, d_xyz )

%*****************************************************************************80
%
%% SPHERE_CVT_STEP takes one CVT step on a sphere.
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
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real XYZ(3,N), points on a sphere.
%
%    Output, real CENTROID(3,N), the centroids of the Voronoi polygons
%    defined by the points.
%

%
%  Compute the Delaunay triangulation.
%
  [ face_num, face ] = sphere_delaunay ( n, d_xyz );
% i4mat_transpose_print ( 3, face_num, face, '  Delaunay vertices:' );
%
%  For each Delaunay triangle, compute the normal vector, to get the 
%  Voronoi vertex.
%
  v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
% r8mat_transpose_print ( 3, face_num, v_xyz , '  Voronoi vertices' );
%
%  Compute the Voronoi vertex lists that define the Voronoi polygons.
%
  [ first, list ] = voronoi_polygons ( n, face_num, face );
  list_num = 2 * face_num;
% i4list_print ( n, first, list_num, list, '  Voronoi polygons:' );
%
%  Compute the areas of the Voronoi polygons.
%
  v_num = face_num;
  area = voronoi_areas ( n, first, list_num, list, d_xyz, v_num, v_xyz );
% r8vec_print ( n, area, '  Voronoi areas:' );
%
%  Compute the centroids of the polygons.
%
  v_num = face_num;
  centroid = voronoi_centroids ( n, first, list_num, list, d_xyz, v_num, v_xyz );
% r8mat_transpose_print ( 3, n, centroid, '  Voronoi centroids' );

  return
end
