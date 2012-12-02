function quality = triangle_quality_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_QUALITY_2D: "quality" of a triangle in 2D.
%
%  Discussion:
%
%    The quality of a triangle is 2 times the ratio of the radius of the inscribed
%    circle divided by that of the circumscribed circle.  An equilateral
%    triangle achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2009
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
%    Output, real QUALITY, the quality of the triangle.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );

  if ( a * b * c == 0.0 )
    quality = 0.0;
  else
    quality = ( - a + b + c ) * ( a - b + c ) * ( a + b - c ) / ( a * b * c );
  end

  return
end
