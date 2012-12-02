function sphere_voronoi_plot ( n, d_xyz )

%*****************************************************************************80
%
%% SPHERE_VORONOI_PLOT plots the Voronoi diagram on a sphere.
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
  title ( 'Voronoi polygons using PATCH' );
  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Voronoi polygons using PATCH.\n' );

  return
end
