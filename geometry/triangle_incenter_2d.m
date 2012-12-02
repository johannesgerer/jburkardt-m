function center = triangle_incenter_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_INCENTER_2D computes the incenter of a triangle in 2D.
%
%  Discussion:
%
%    The incenter of a triangle is the center of the inscribed circle.
%
%    The inscribed circle of a triangle is the largest circle that can
%    be drawn inside the triangle.
%
%    The inscribed circle is tangent to all three sides of the triangle.
%
%    The angle bisectors of the triangle intersect at the center of the
%    inscribed circle.
%
%    In geometry, the incenter is often represented by "I".
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
%    Output, real CENTER(2,1), the incenter.
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
  else
    center(1:dim_num,1) = ( b * t(1:dim_num,1) ...
                          + c * t(1:dim_num,2) ...
                          + a * t(1:dim_num,3) ) / perimeter;
  end

  return
end
