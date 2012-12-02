function area = triangle_area_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_3D computes the area of a triangle in 3D.
%
%  Discussion:
%
%    This routine uses the fact that the norm of the cross product vector
%    is the area of the parallelogram they form.  The triangle they
%    form has half that area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2005
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
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  dim_num = 3;
%
%  Compute the cross product vector.
%
  cross(1) = ( t(2,2) - t(2,1) ) * ( t(3,3) - t(3,1) ) ...
           - ( t(3,2) - t(3,1) ) * ( t(2,3) - t(2,1) );

  cross(2) = ( t(3,2) - t(3,1) ) * ( t(1,3) - t(1,1) ) ...
           - ( t(1,2) - t(1,1) ) * ( t(3,3) - t(3,1) );

  cross(3) = ( t(1,2) - t(1,1) ) * ( t(2,3) - t(2,1) ) ...
           - ( t(2,2) - t(2,1) ) * ( t(1,3) - t(1,1) );

  area = 0.5 * sqrt ( sum ( cross(1:dim_num).^2 ) );

  return
end
