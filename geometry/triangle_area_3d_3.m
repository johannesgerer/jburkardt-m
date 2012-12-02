function area = triangle_area_3d_3 ( t )

%*****************************************************************************80
%
%% TRIANGLE_AREA_3D_3 computes the area of a triangle in 3D.
%
%  Discussion:
%
%    This routine uses Heron's formula.
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
%    Input, real T(3,3), the triangle vertices.
%
%    Output, real AREA, the area of the triangle.
%
  dim_num = 3;

  for j = 1 : 3
    jp1 = mod ( j, 3 ) + 1;
    s(j) = 0.0;
    for i = 1 : dim_num
      s(j) = s(j) + ( t(i,j) - t(i,jp1) )^2;
    end
    s(j) = sqrt ( s(j) );
  end

  area = (   s(1) + s(2) + s(3) ) ...
       * ( - s(1) + s(2) + s(3) ) ...
       * (   s(1) - s(2) + s(3) ) ...
       * (   s(1) + s(2) - s(3) );

  if ( area < 0.0 )
    area = -1.0;
    return
  end

  area = 0.25 * sqrt ( area );

  return
end
