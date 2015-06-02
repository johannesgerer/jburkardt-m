function surf_test01 ( )

%*****************************************************************************80
%
%% SURF_TEST01 demonstrates MATLAB's SURF command.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SURF_TEST01\n' );
  fprintf ( 1, '  SURF can plot a 3D surface Z = F(X,Y).\n' );
%
%  Set the X and Y grid points, and then form a 2D mesh.
%
  x = linspace ( -3.0, +3.0, 61 );
  y = linspace ( -3.0, +3.0, 61 );
  [ X, Y ] = meshgrid ( x, y );
%
%  This is the formula for the MATLAB "peaks" function.
%
  Z =  3*(1-X).^2.*exp(-(X.^2) - (Y+1).^2) ... 
     - 10*(X/5 - X.^3 - Y.^5).*exp(-X.^2-Y.^2) ... 
     - 1/3*exp(-(X+1).^2 - Y.^2);
%
%  C is used to color the plot.  We only want two colors, for Z above
%  or below 1.5.  So we set C to a logical value, but we have to convert
%  it to a numeric value for it to be accepted by surf().
%
  C = double ( 1.5 < Z );
%
%  Our color map goes from blue (low) to red (high).  
%
  colormap ( [ 0.7, 0.7, 1.0 ; 1, 0, 0 ] )
%
%  Figure #1
%
  figure ( 1 )
  clf
%
%  Draw the surface plot.
%
  surf ( X, Y, Z, C );
%
%  Set the ranges for the plot axes.
%
  axis ( [ -3.0, +3.0, -3.0, +3.0, -7.0, 8.5 ] )
%
%  Label things.
%
  title ( 'F(X,Y) > 1.5, 3D surface view', 'FontSize', 24 )
  xlabel ( '<--- X --->', 'FontSize', 12 );
  ylabel ( '<--- Y --->', 'FontSize', 12 );
  zlabel ( '<--- F(X,Y) --->', 'FontSize', 24 );
%
%  View the graph in 3D.
%
  view ( -38, 18 )
  filename = 'surf_test01_3d.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );
%
%  Figure #2.
%  View the graph in 2D, from 'overhead'.
%
  figure ( 2 )
  clf

  surf ( X, Y, Z, C, 'EdgeColor', 'None' );
  axis ( [ -3.0, +3.0, -3.0, +3.0, -7.0, 8.5 ] )
  view ( 0, 90 )
  title ( 'F(X,Y) > 1.5, XY contour view', 'FontSize', 24 )
  xlabel ( '<--- X --->', 'FontSize', 12 );
  ylabel ( '<--- Y --->', 'FontSize', 12 );
  zlabel ( '<--- F(X,Y) --->', 'FontSize', 24 );
  filename = 'surf_test01_2d.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end

