function [ r, center ] = triangle_circumcircle_2d_2 ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMCIRCLE_2D_2 computes the circumcircle of a triangle in 2D.
%
%  Discussion:
%
%    The circumscribed circle of a triangle is the circle that passes through
%    the three vertices of the triangle.  The circumscribed circle contains
%    the triangle, but it is not necessarily the smallest triangle to do so.
%
%    Surprisingly, the diameter of the circle can be found by solving
%    a 2 by 2 linear system.  This is because the vectors P2 - P1
%    and P3 - P1 are secants of the circle, and each forms a right
%    triangle with the diameter.  Hence, the dot product of
%    P2 - P1 with the diameter is equal to the square of the length
%    of P2 - P1, and similarly for P3 - P1.  This determines the
%    diameter vector originating at P1.
%
%    If all angles of the triangle are no greater than 90 degrees, then
%    the center of the circumscribed circle will lie inside the triangle.
%    Otherwise, the center will lie outside the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
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
%    Output, real R, CENTER(2,1), the circumradius and circumcenter.
%
  dim_num = 2;
  nrhs = 1;
%
%  Set up the linear system.
%
  a(1,1) = t(1,2) - t(1,1);
  a(1,2) = t(2,2) - t(2,1);
  a(1,3) = ( t(1,2) - t(1,1) )^2 + ( t(2,2) - t(2,1) )^2;

  a(2,1) = t(1,3) - t(1,1);
  a(2,2) = t(2,3) - t(2,1);
  a(2,3) = ( t(1,3) - t(1,1) )^2 + ( t(2,3) - t(2,1) )^2;
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, nrhs, a );

  if ( info ~= 0 )
    r = -1.0
    center(1:dim_num,1) = 0.0;
  end

  r = 0.5 * sqrt ( a(1,dim_num+1) * a(1,dim_num+1) ...
    + a(2,dim_num+1) * a(2,dim_num+1) );
  center(1:dim_num,1) = t(1:dim_num,1) + 0.5 * a(1:dim_num,dim_num+1);

  return
end
