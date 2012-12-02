function r = triangle_circumradius_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_CIRCUMRADIUS_2D computes the circumradius of a triangle in 2D.
%
%  Discussion:
%
%    The circumscribed circle of a triangle is the circle that passes through
%    the three vertices of the triangle.  The circumscribed circle contains
%    the triangle, but it is not necessarily the smallest triangle to do so.
%
%    The circumradius of a triangle is the radius of the circumscribed
%    circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real R, the circumradius of the circumscribed circle.
%
  dim_num = 2;
%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:dim_num,1) - t(1:dim_num,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:dim_num,2) - t(1:dim_num,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:dim_num,3) - t(1:dim_num,1) ).^2 ) );

  bot = ( a + b + c ) * ( - a + b + c ) * (   a - b + c ) * (   a + b - c );

  if ( bot <= 0.0 )
    r = -1.0;
    return
  end

  r = a * b * c / sqrt ( bot );

  return
end
