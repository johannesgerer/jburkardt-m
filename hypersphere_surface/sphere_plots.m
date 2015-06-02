function sphere_plots ( )

%*****************************************************************************80
%
%% SPHERE_PLOTS plots the surface and the R(Theta) function for a sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_PLOTS:\n' );
  fprintf ( 1, '  For a 3D sphere defined by a 0/1 characteristic function,\n' );
  fprintf ( 1, '  plot the surface, and R(Theta),\n' );
  fprintf ( 1, '  using a centered point, and then an offcentered point.\n' );
%
%  1): Plot the surface, using a centered base point.
%
  n1 = 31;
  n2 = 61;
  theta1 = linspace ( 0.0,       pi, n1 );
  theta2 = linspace ( 0.0, 2.0 * pi, n2 );

  [ t1, t2 ] = meshgrid ( theta2, theta1 );
%
%  In case you're wondering, I had to list the input to MESHGRID in the
%  "wrong" order so that T1 and T2 will have the "right" dimensions of
%  N1 x N2.  Sorry, I'm sure there's a wonderful reason for MESHGRID's
%  bizarre convention.
%
  r = zeros ( n1, n2 );

  x0 = [ 0.0, 0.0, 0.0 ];
  for i = 1 : n1
    for j = 1 : n2 
      r(i,j) = bisect_characteristic ( x0, [ t1(i,j); t2(i,j) ], @sphere_characteristic );
    end
  end

  x1 = r .* cos ( t1 );
  x2 = r .* sin ( t1 ) .* cos ( t2 );
  x3 = r .* sin ( t1 ) .* sin ( t2 );

  figure ( 1 )
  mesh ( x3, x2, x1, 'FaceColor', 'interp' );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 16 );
  ylabel ( '<---Y--->', 'FontSize', 16 );
  zlabel ( '<---Z--->', 'FontSize', 16 );
  title ( 'Sphere transition surface', 'FontSize', 24 )
  hold off
  filename =  'sphere_centered_surface.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  2): Plot R as a function of Theta for a centered base point.
%  If you don't specify the Z range, the plot looks like garbage
%  because it's a constant + roundoff noise.
%
  figure ( 2 )
  mesh ( t1, t2, r );
  axis ( [0, 2.0 * pi, 0.0, pi, 0.0, 1.5 ] ); 
  xlabel ( '<---Theta2--->', 'FontSize', 16 )
  ylabel ( '<---Theta1--->', 'FontSize', 16 );
  zlabel ( '<---R(Theta1,Theta2)--->', 'FontSize', 16 )
  title ( 'R(*,*) from base point to surface', 'FontSize', 24 )
  grid on
  filename = 'sphere_centered_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  3): Plot the surface, using an offcentered base point.
%  I really just wanted BLACK lines for this mesh, but as usual,
%  MATLAB's graphics system is impenetrable so I settled for a
%  grayscale colormap.
%
  n1 = 31;
  n2 = 61;
  theta1 = linspace ( 0.0,       pi, n1 );
  theta2 = linspace ( 0.0, 2.0 * pi, n2 );

  [ t1, t2 ] = meshgrid ( theta2, theta1 );
  r = zeros ( n1, n2 );

  x0 = [ -0.4, -0.6, -0.5 ];
  for i = 1 : n1
    for j = 1 : n2 
      r(i,j) = bisect_characteristic ( x0, [ t1(i,j); t2(i,j) ], @sphere_characteristic );
    end
  end

  x1 = r .* cos ( t1 );
  x2 = r .* sin ( t1 ) .* cos ( t2 );
  x3 = r .* sin ( t1 ) .* sin ( t2 );

  figure ( 3 )
  c = zeros ( n1, n2 );
  colormap ( 'gray' )
  mesh ( x3, x2, x1, c );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 16 );
  ylabel ( '<---Y--->', 'FontSize', 16 );
  zlabel ( '<---Z--->', 'FontSize', 16 );
  title ( 'Sphere transition surface', 'FontSize', 24 )
  hold off
  filename =  'sphere_offcentered_surface.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  4): Plot R as a function of Theta for an offcentered base point.
%
  figure ( 4 )
  mesh ( t1, t2, r, 'FaceColor', 'Interp' );
  xlabel ( '<---Theta2--->', 'FontSize', 16 )
  ylabel ( '<---Theta1--->', 'FontSize', 16 );
  zlabel ( '<---R(Theta1,Theta2)--->', 'FontSize', 16 )
  title ( 'R(*,*) from base point to surface', 'FontSize', 24 )
  grid on
  filename = 'sphere_offcentered_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note variation in R for the offcenter case:\n' );
  fprintf ( 1, '  Min R = %g\n', min ( min ( r ) ) );
  fprintf ( 1, '  Max R = %g\n', max ( max ( r ) ) );
  return
end
