function circle_inout ( )

%*****************************************************************************80
%
%% CIRCLE_INOUT plots data in and out of a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_INOUT:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a scatterplot of two sets of data representing\n' );
  fprintf ( 1, '  points in the unit square that are also in or not in\n' );
  fprintf ( 1, '  the unit circle.\n' );
%
%  Read the data.
%
  xy_in = load ( 'circle_in.txt' );
  [ n_in, dim ] = size ( xy_in );

  xy_out = load ( 'circle_out.txt' );
  [ n_out, dim ] = size ( xy_out );

  n = n_in + n_out;
%
%  Report on the estimate for pi:
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points inside the circle = %d\n', n_in );
  fprintf ( 1, '  Number outside                     = %d\n', n_out );
  fprintf ( 1, '  Total                              = %d\n', n );
  fprintf ( 1, '  Estimate for PI                    = %d\n', 4 * n_in / n );
%
%  Set up points on a circle
%
  n = 50;
  center = [ 0.0, 0.0 ];
  radius = 1.0;
  theta1 = 0.0;
  theta2 = 90.0;

  xy_circ = circle_arc ( n, center, radius, theta1, theta2 );
%
%  Plot the data.
%
  plot ( xy_in(:,1),  xy_in(:,2),  'b.', ...
         xy_out(:,1), xy_out(:,2), 'r.', ...
         xy_circ(:,1), xy_circ(:,2), 'r-', 'LineWidth', 2 );
  grid on
  axis ( [ 0.0, 1.0, 0.0, 1.0 ] )
  axis equal
  axis square
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Random points inside/outside the unit circle' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_INOUT:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function xy_circ = circle_arc ( n, center, radius, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_ARC samples points on a circular arc.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sample points.
%
%    Input, real CENTER(2), the center of the circle.
%
%    Input, real RADIUS, the radius of the circle.
%
%    Input, real THETA1, THETA2, the angular coordinates of the first and
%    last points on the arc, in degrees.
%
%    Output, real XY_CIRC(N,2), points along the arc.
%
  t = pi * linspace ( theta1, theta2, n ) / 180;
  t = t';

  xy_circ = zeros ( n, 2 );

  xy_circ(:,1) = center(1) + radius * cos ( t(:,1) );
  xy_circ(:,2) = center(2) + radius * sin ( t(:,1) );

  return
end
