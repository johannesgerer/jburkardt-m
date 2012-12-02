function xy = circle_arc_grid ( r, c, a, n )

%*****************************************************************************80
%
%% CIRCLE_ARC_GRID computes grid points along a circular arc.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real C(2), the coordinates of the center.
%
%    Input, real A(2), the angle of the first and last
%    points, in DEGREES.
%
%    Input, integer N, the number of points.
%
%    Output, real XY(2,N), the grid points.
%
  xy = zeros ( 2, n );

  aj = linspace ( a(1), a(2), n )';

  xy(1,1:n) = c(1) + r * cos ( aj(1:n) * pi / 180.0 );
  xy(2,1:n) = c(2) + r * sin ( aj(1:n) * pi / 180.0 );

  return
end
