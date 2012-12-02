function sphere_delaunay_test03 ( )

%*****************************************************************************80
%
%% SPHERE_DELAUNAY_TEST03: triangulation of SPHERE_GRIDPOINTS_ICOS2 points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_DELAUNAY_TEST03\n' );
  fprintf ( 1, '  Choose SPHERE_GRIDPOINTS_ICOS2 points on the unit sphere.\n' );
  fprintf ( 1, '  Call SPHERE_DELAUNAY to compute the Delaunay triangulation.\n' );
  fprintf ( 1, '  Display an image of the Delaunay triangulation.\n' );
%
%  Double the points on an icosahedral mesh of the sphere:
%
  factor = 2;
  [ node_num, edge_num, triangle_num ] = sphere_grid_icos_size ( factor );
  xyz = sphere_gridpoints_icos2 ( factor, node_num );

  r8mat_transpose_print ( 3, node_num, xyz, '  Data points:' );
%
%  Compute the Delaunay triangulation of the points.
%
  [ face_num, face ] = sphere_delaunay ( node_num, xyz );

  i4mat_transpose_print ( 3, face_num, face, '  Triangles' );
%
%  Plot the triangles.
%  Allow MATLAB to color the triangles, even though it makes a sorry
%  set of choices!
%
  figure ( 3 )
  clf
  trisurf ( face', xyz(1,:), xyz(2,:), xyz(3,:) );
  axis equal
  xlabel ( '-- X --' );
  ylabel ( '-- Y --' );
  zlabel ( '-- Z --' );
  title ( 'Figure 1: Delaunay triangulation with TRISURF.' )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 1: Delaunay triangulation with TRISURF' );

  filename = 'test03_plot1.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 'Plot saved as "%s".\n', filename );
%
%  Plot the triangles one at a time.
%  You can set a single color, or specify it as an RGB value for
%  each triangle, but I haven't found a way to make a plot that is
%  pleasant to look at.
%
  figure ( 4 )
  clf
  hold on
  d = [ 1, 2, 3, 1 ];
  for i = 1 : face_num
    j = face(d,i);
    h(i) = patch ( xyz(1,j), xyz(2,j), xyz(3,j), 'blue', ...
      'EdgeColor', 'r', 'LineWidth', 2.0, 'FaceAlpha', 0.7 );
  end
  axis equal
  xlabel ( '-- X --' );
  ylabel ( '-- Y --' );
  zlabel ( '-- Z --' );
  title ( 'Figure 2: Delaunay triangulation using PATCH' );
  hold off

  filename = 'test03_plot2.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 'Plot saved as "%s".\n', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 2: Delaunay triangulation with PATCH.\n' );

  return
end
