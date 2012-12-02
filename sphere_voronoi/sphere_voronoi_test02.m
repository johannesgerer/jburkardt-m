function sphere_voronoi_test02 ( )

%*****************************************************************************80
%
%% SPHERE_VORONOI_TEST02 displays the Voronoi polygons of the data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_VORONOI_TEST02\n' );
  fprintf ( 1, '  Choose random points on the unit sphere.\n' );
  fprintf ( 1, '  Call SPHERE_DELAUNAY to compute the Delaunay triangulation.\n' );
  fprintf ( 1, '  Display an image of the Delaunay triangulation.\n' );
%
%  Choose a random set of "Delaunay" points on the unit sphere.
%
  n = 50;
  seed = 123456789;
  [ d_xyz, seed ] = uniform_on_sphere01_map ( 3, n, seed );
  r8mat_transpose_print ( 3, n, d_xyz, '  Delaunay points:' );
%
%  Compute the Delaunay triangulation.
%
  [ face_num, face ] = sphere_delaunay ( n, d_xyz );
%
%  For each Delaunay triangle, compute the normal vector, to get the 
%  Voronoi vertex.
%
  v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
%
%  Compute the Voronoi vertex lists that define the Voronoi polygons.
%
  [ first, list ] = voronoi_polygons ( n, face_num, face );
  list_num = 2 * face_num;
%
%  Plot the polygons.
%
  clf
  hold on

  for i = 1 : n
    n1 = first(i);
    n2 = first(i+1) - 1;
    j = list(n1:n2);
    j = [ j; list(n1) ];
    h(i) = patch ( v_xyz(1,j), v_xyz(2,j), v_xyz(3,j), 'blue', ...
      'EdgeColor', 'r', 'LineWidth', 2.0, 'FaceAlpha', 0.9 );
  end

  plot3 ( d_xyz(1,:), d_xyz(2,:), d_xyz(3,:), 'r*' );

  axis equal
  xlabel ( '-- X --' );
  ylabel ( '-- Y --' );
  zlabel ( '-- Z --' );
  title ( 'Figure 1: Voronoi polygons using PATCH' );
  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 1: Voronoi polygons using PATCH.\n' );

  return
end
