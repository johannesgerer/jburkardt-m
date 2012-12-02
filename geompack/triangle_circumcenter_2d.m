function center = triangle_circumcenter_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCENTER_2D computes the circumcenter of a triangle in 2D.
%
%  Discussion:
%
%    The circumcenter of a triangle is the center of the circumcircle, the
%    circle that passes through the three vertices of the triangle.
%
%    The circumcircle contains the triangle, but it is not necessarily the
%    smallest triangle to do so.
%
%    If all angles of the triangle are no greater than 90 degrees, then
%    the center of the circumscribed circle will lie inside the triangle.
%    Otherwise, the center will lie outside the circle.
%
%    The circumcenter is the intersection of the perpendicular bisectors
%    of the sides of the triangle.
%
%    In geometry, the circumcenter of a triangle is often symbolized by "O".
%
%  Modified:
%
%    09 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTER(2), the circumcenter of the triangle.
%
  ndim = 2;

  asq = ( t(1,2) - t(1,1) ).^2 + ( t(2,2) - t(2,1) ).^2;
  csq = ( t(1,3) - t(1,1) ).^2 + ( t(2,3) - t(2,1) ).^2;
  
  top(1) =  ( t(2,2) - t(2,1) ) * csq - ( t(2,3) - t(2,1) ) * asq;
  top(2) =  ( t(1,2) - t(1,1) ) * csq - ( t(1,3) - t(1,1) ) * asq;

  bot  =  ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) ) ...
        - ( t(2,3) - t(2,1) ) * ( t(1,2) - t(1,1) );

  center(1:2) = t(1:2,1)' + 0.5D+00 * top(1:2) / bot;

  return
end
