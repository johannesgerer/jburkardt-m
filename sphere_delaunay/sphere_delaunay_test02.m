function sphere_delaunay_test02 ( )

%*****************************************************************************80
%
%% SPHERE_DELAUNAY_TEST02 displays the Delaunay triangulation of the data.
%
%  Discussion:
%
%    Unfortunately, it's not easy to get MATLAB to draw a smooth spherical
%    surface, on which to display smooth spherical triangles and smooth
%    spherical arcs.
%
%    It is easy to get MATLAB to draw the plane polygons formed by the
%    points on the surface.  However, even for 100 points, the result looks
%    bumpy and irregular.  This is entirely a graphics issue.
%
%    The coloring of the individual triangles is also vexing.  By default,
%    MATLAB colors the triangles on a blue to red scaled based on something
%    like the average of the Z values of the vertices.  This means that
%    groups of triangles seem to merge, whereas we would like neighboring
%    triangles to be easily distinguishable.
%
%    I've tried going directly to the PATCH command, which offers control
%    over the color of each triangular face, but the specification of a color
%    and its application to the patch are cumbersome, and the results I get
%    don't correspond with what I think I am asking for, and moreover 
%    look hideous.  So while we can try to visualize the Delaunay triangulation 
%    on the sphere, what we are seeing, at least with the commands I have
%    tried, still requires patience, imagination, and tolerance on the
%    part of the viewer.
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
  fprintf ( 1, 'SPHERE_DELAUNAY_TEST02\n' );
  fprintf ( 1, '  Choose random points on the unit sphere.\n' );
  fprintf ( 1, '  Call SPHERE_DELAUNAY to compute the Delaunay triangulation.\n' );
  fprintf ( 1, '  Display an image of the Delaunay triangulation.\n' );
%
%  Choose a random set of points on the unit sphere.
%
  n = 100;
  seed = 123456789;
  [ xyz, seed ] = uniform_on_sphere01_map ( 3, n, seed );
  r8mat_transpose_print ( 3, n, xyz, '  Data points:' );
%
%  Compute the Delaunay triangulation.
%
  [ face_num, face ] = sphere_delaunay ( n, xyz );
%
%  Plot the triangles.
%  Allow MATLAB to color the triangles, even though it makes a sorry
%  set of choices!
%
  figure ( 1 )
  clf
  trisurf ( face', xyz(1,:), xyz(2,:), xyz(3,:) );
  axis equal
  xlabel ( '-- X --' );
  ylabel ( '-- Y --' );
  zlabel ( '-- Z --' );
  title ( 'Figure 1: Delaunay triangulation with TRISURF.' )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 1: Delaunay triangulation with TRISURF' );

  filename = 'test02_plot1.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 'Plot saved as "%s".\n', filename );
%
%  Plot the triangles one at a time.
%  You can set a single color, or specify it as an RGB value for
%  each triangle, but I haven't found a way to make a plot that is
%  pleasant to look at.
%
  figure ( 2 )
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

  filename = 'test02_plot2.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 'Plot saved as "%s".\n', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Figure 2: Delaunay triangulation with PATCH.\n' );

  return
end
