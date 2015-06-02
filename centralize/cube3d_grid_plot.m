function figure_num = cube3d_grid_plot ( x1, x2, x3, filename, figure_num )

%*****************************************************************************80
%
%% CUBE3D_GRID_PLOT plots hypersphere gridpoints onto the surface of a 3D cube. 
%
%  Discussion:
%
%    The X1, X2, X3 data has, presumably, been computed by CUBE_GRID for
%    a 3D cube.
%
%    This function plots the surface, and then the surface plus the 
%    projected grid points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1(2*N+1,N+1), X2(2*N+1,N+1), X3(2*N+1,N+1), the coordinates 
%    of points on the cube surface, projected from the hypersphere.
%
%    Input, string FILENAME, the "first name" of the two files to be created:
%    filename_surface.png and filename_points.png.
%
%    Input/output, int FIGURE_NUM, the current figure index.
%
  if ( nargin < 4 )
    filename = 'cube';
  end
%
%  Draw the surface.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  mesh ( x3, x2, x1, 'FaceColor', 'interp' );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 16 );
  ylabel ( '<---Y--->', 'FontSize', 16 );
  zlabel ( '<---Z--->', 'FontSize', 16 );
  title ( 'Cube transition surface', 'FontSize', 24 )
  hold off
  filename1 = sprintf ( '%s_surface.png', filename );
  print ( '-dpng', filename1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plotfile "%s".\n', filename1 );
%
%  Draw the surface and points.
%
%  Listing the points in the order X1, X2, X3, rational as it may seem,
%  is apparently NOT the way to go here.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  hold on
  mesh ( x3, x2, x1, 'FaceColor', 'interp' );
  plot3 ( x3, x2, x1, 'k.', 'MarkerSize', 5 );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 16 );
  ylabel ( '<---Y--->', 'FontSize', 16 );
  zlabel ( '<---Z--->', 'FontSize', 16 );
  title ( 'Grid points on transition surface', 'FontSize', 24 )
  hold off
  filename2 = sprintf ( '%s_points.png', filename );
  print ( '-dpng', filename2 );
  fprintf ( 1, '  Created plotfile "%s".\n', filename2 );

  return
end
