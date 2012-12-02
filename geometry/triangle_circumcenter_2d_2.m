function center = triangle_circumcenter_2d_2 ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCENTER_2D_2 computes the circumcenter of a triangle in 2D.
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
%    Otherwise, the center will lie outside the triangle.
%
%    The circumcenter is the intersection of the perpendicular bisectors
%    of the sides of the triangle.
%
%    Surprisingly, the diameter of the circle can be found by solving
%    a 2 by 2 linear system.  If we label the vertices of the triangle
%    P1, P2 and P3, then the vectors P2 - P1 and P3 - P1 are secants of
%    the circle, and each forms a right triangle with the diameter.
%    Hence, the dot product of P2 - P1 with the diameter vector is equal
%    to the square of the length of P2 - P1, and similarly for P3 - P1.
%    This determines the diameter vector originating at P1.
%
%    In geometry, the circumcenter of a triangle is often symbolized by "O".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTER(2,1), the circumcenter of the triangle.
%
  dim_num = 2;
  nrhs = 1;
%
%  Set up the linear system.
%
  a(1,1) = t(1,2) - t(1,1);
  a(1,2) = t(2,2) - t(2,1);
  a(1,3) = ( t(1,2) - t(1,1) ).^2 + ( t(2,2) - t(2,1) ).^2;

  a(2,1) = t(1,3) - t(1,1);
  a(2,2) = t(2,3) - t(2,1);
  a(2,3) = ( t(1,3) - t(1,1) ).^2 + ( t(2,3) - t(2,1) ).^2;
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, nrhs, a );
%
%  Compute the center
%
  if ( info ~= 0 )
    center(1:dim_num,1) = 0.0;
  else
    center(1:dim_num,1) = t(1:dim_num,1) + 0.5 * a(1:dim_num,dim_num+1);
  end

  return
end

