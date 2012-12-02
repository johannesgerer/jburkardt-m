function [ r, center ] = triangle_incircle_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_INCIRCLE_2D computes the inscribed circle of a triangle in 2D.
%
%  Discussion:
%
%    The inscribed circle of a triangle is the largest circle that can
%    be drawn inside the triangle.  It is tangent to all three sides,
%    and the lines from its center to the vertices bisect the angles
%    made by each vertex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
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
%    Output, real R, CENTER(2,1), the radius and center of the
%    inscribed circle.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );

  perimeter = a + b + c;

  if ( perimeter == 0.0 )
    center(1:dim_num,1) = t(1:dim_num,1);
    r = 0.0;
    return
  end

  center(1:dim_num,1) = (  ...
      b * t(1:dim_num,1) ...
    + c * t(1:dim_num,2) ...
    + a * t(1:dim_num,3) ) / perimeter;

  r = 0.5 * sqrt ( ...
      ( - a + b + c )  ...
    * ( + a - b + c )  ...
    * ( + a + b - c ) / perimeter );

  return
end
