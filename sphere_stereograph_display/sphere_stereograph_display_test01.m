function sphere_stereograph_display_test01 ( )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_DISPLAY_TEST01 stereographs icosahedral points.
%
%  Discussion:
%
%    We start with a sphere of radius 1 and center (0,0,0).
%
%    We identify the point (0,0,-1) as the focus.
%
%    We identify the point (0,0,+1) as a point on the projection plane,
%    and the direction (0,0,1) as the normal direction to the plane.
%
%    We choose 12 points on the sphere, which form the vertices of
%    an icosahedron.  We map each point to the plane by drawing a line
%    from the focus through the point to intersect the plane.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2010
%
%  Author:
%
%    John Burkardt
%
  figure ( 1 )
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
%  Set the icosahedral points.
%
  phi = 0.5 * ( sqrt ( 5.0 ) + 1.0 );
  b = 1.0 / sqrt ( 1.0 + phi * phi );
  a = phi * b;
  z = 0.0;

  n = 12;
  p(1:3,1:12) = [ ...
      a,  b,  z; ...
      a, -b,  z; ...
      b,  z,  a; ...
      b,  z, -a; ...
      z,  a,  b; ...
      z,  a, -b; ...
      z, -a,  b; ...
      z, -a, -b; ...
     -b,  z,  a; ...
     -b,  z, -a; ...
     -a,  b,  z; ...
     -a, -b,  z ]';
%
%  Compute the stereographic images of the points.
%
  q = sphere_stereograph ( p );
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

  title ( 'Stereographic Projection of Icosahedral Points' )

  hold off

  return
end
