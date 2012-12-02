function contour_gradient ( xmin, xmax, ymin, ymax, f )

%*****************************************************************************80
%
%% CONTOUR_GRADIENT plots contours and gradients for F(X,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XMIN, XMAX, YMIN, YMAX, define the plotting rectangle.
%
%    Input, function Z = F ( X, Y ), a handle to the function.
%

%
%  Create the mesh.
%
  x = linspace ( xmin, xmax, 21 );
  y = linspace ( ymin, ymax, 21 );
%
%  Create the grid.
%
  [ X, Y ] = meshgrid ( x, y );
%
%  Evaluate the function.
%
  Z = f ( X, Y );
%
%  Draw the contours.
%
  clf
  hold on

  contour_num = 20;
  contour ( X, Y, Z, contour_num )
%
%  Evaluate the gradient.
%
  h = 0.01;
  [ U, V ] = gradient ( Z, h );
%
%  Plot the gradient vectors as arrows.
%
  quiver ( X, Y, U, V );

  xlabel ( '<--X-->' )
  ylabel ( '<--Y-->' )
  title ( 'Contours and Gradient Vectors' )

  hold off

  return
end
