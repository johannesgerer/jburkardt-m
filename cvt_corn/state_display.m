function state_display ( nb, ni, np, r, p_xy, p_type, header )

%*****************************************************************************80
%
%% STATE_DISPLAY displays the current state.
%
%  Discussion:
%
%    The state includes the circle of radius R, the points of type 1 which
%    are constrained to the circle, and the points of type 2 which are 
%    constrained to the interior of the circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NB, the number of boundary points.
%
%    Input, integer NI, the number of interior points.
%
%    Input, integer NP, the total number of points.
%
%    Input, real R, the radius of the circle.
%
%    Input, real P_XY(2,NP), the coordinates of the points.
%
%    Input, integter P_TYPE(1,NP), the type of each point.
%    1, the point is constrained to the boundary.
%    2, the point is constrained to the interior.
%
%    Input, string HEADER, a title for the plot.
%

%
%  Compute plot points on the circle.
%
  nc = 101;
  c_theta = linspace ( 0.0, 1.0, nc );
  c_xy(1,1:nc) = r * cos ( 2.0 * pi * c_theta(1:nc) );
  c_xy(2,1:nc) = r * sin ( 2.0 * pi * c_theta(1:nc) );
%
%  Index the boundary and interior points.
%
  circle = find ( p_type == 1 );
  disk = find ( p_type == 2 );
%
%  Display the configuration.
%
  clf
  hold on
  plot ( c_xy(1,:), c_xy(2,:), 'k-' )
  plot ( p_xy(1,circle), p_xy(2,circle), 'r.', 'MarkerSize', 30 );
  plot ( p_xy(1,disk), p_xy(2,disk), 'b.', 'MarkerSize', 30 );
  grid on
  axis equal
  xlabel ( '<--X-->' )
  ylabel ( '<--Y-->' )
  title ( header );
  hold off

  return
end
