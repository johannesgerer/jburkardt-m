function cvt_display ( r, p_xy, p_type, header )

%*****************************************************************************80
%
%% CVT_DISPLAY displays the estimated CVT diagram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real P_XY(2,NP), the coordinates of the points.
%
%    Input, integter P_TYPE(1,NP), the type of each point.
%    1, the point is constrained to the circle.
%    2, the point is constrained to the disk.
%
%    Input, string HEADER, a title.
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
%  Display the points, and the Voronoi diagram.
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
  title ( header )
  voronoi ( p_xy(1,:), p_xy(2,:) )
  hold off
 
  return
end

