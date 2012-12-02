function sphere_stereograph_display_test02 ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_DISPLAY_TEST02 displays inverse stereograph points.
%
%  Discussion:
%
%    We draw a circle on the plane and then compute the inverse stereographic
%    images on the sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2010
%
%  Author:
%
%    John Burkardt
%
  figure ( 2 )
%
%  Generate data to display a semi-transparent sphere.
%
  [ x, y, z ] = sphere ( 20 );
  c = 0.20 * ones ( size ( z ) );
  surf ( x, y, z, c, 'EdgeColor', 'none' );
  alpha ( 0.5 );
%
%  Hold the graphics screen for more output.
%
  hold on
%
%  Draw a magenta plane.
%
  x = [ -2, 2, 2, -2 ];
  y = [ -2, -2, 2, 2 ];
  z = [ 1, 1, 1, 1 ];
  c = 'm';
  patch ( x, y, z, c );
  alpha ( 0.5 );
%
%  Set the points on the plane.
%
  n = 24;
  angle = ( 0 : n - 1 ) * 2 * pi / n;
  q = zeros ( 3, n );
  q(1,1:n) = 1 + cos ( angle );
  q(2,1:n) = sin ( angle );
  q(3,1:n) = 1.0;
%
%  Compute the stereographic pre-images of the points.
%
  p = sphere_stereograph_inverse ( q );
%
%  Draw the focus, center, and pole points in black.
%
  scatter3 ( [0, 0, 0], [0, 0, 0], [-1, 0, +1], 'filled', 'k', 'SizeData', 100 );
%
%  Draw the object points in blue.
%
  scatter3 ( p(1,:), p(2,:), p(3,:), 'filled', 'b' );
%
%  Draw the image points in red.
%
  scatter3 ( q(1,:), q(2,:), q(3,:), 'filled', 'r' );
%
%  Draw a line through the focus, center, and pole.
%
  line ( [0,0,0], [0,0,0], [-1,0,+1], 'Color', 'k', 'LineWidth', 2 )
%
%  Draw lines from the focus through each object point to its image.
%
  pole = zeros ( 3, n );
  pole(3,1:n) = -1.0;

  for j = 1 : n
    line ( [ pole(1,1:n); p(1,1:n); q(1,1:n)], ...
           [ pole(2,1:n); p(2,1:n); q(2,1:n)], ...
           [ pole(3,1:n); p(3,1:n); q(3,1:n)], ...
      'Color', 'b' )
  end
%
%  Make the axes equal and limit the range.
%
  axis equal
  axis ( [ -2, +2, -2, +2, -2, +2 ] );
%
%  Label the plot.
%
  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )

  title ( 'Inverse Stereographic Projection of a Planar Circle' )

  hold off

  return
end
