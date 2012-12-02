function value = circle_triangle_area_2d ( r, center, theta1, theta2 )

%*****************************************************************************80
%
%% CIRCLE_TRIANGLE_AREA_2D returns the area of a circle triangle in 2D.
%
%  Discussion:
%
%    A circle triangle is formed by drawing a circular arc, and considering
%    the triangle formed by the endpoints of the arc plus the center of
%    the circle.
%
%    Note that for angles greater than PI, the triangle will actually
%    have NEGATIVE area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, real THETA1, THETA2, the angles of the rays that
%    delimit the arc.
%
%    Output, real CIRCLE_TRIANGLE_AREA_2D, the (signed) area
%    of the triangle.
%
  value = 0.5 * r * r * sin ( theta2 - theta1 );

  return
end
