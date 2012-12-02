function area = triangle_area_heron ( s )

%*****************************************************************************80
%
%% TRIANGLE_AREA_HERON computes the area of a triangle using Heron's formula.
%
%  Discussion:
%
%    The formula is valid for any spatial dimension, depending only
%    on the lengths of the sides, and not the coordinates of the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real S(3,1), the lengths of the three sides.
%
%    Output, real AREA, the area of the triangle, or -1.0 if the
%    sides cannot constitute a triangle.
%
  area = (   s(1,1) + s(2,1) + s(3,1) ) ...
       * ( - s(1,1) + s(2,1) + s(3,1) ) ...
       * (   s(1,1) - s(2,1) + s(3,1) ) ...
       * (   s(1,1) + s(2,1) - s(3,1) );

  if ( area < 0.0 )
    area = -1.0;
    return
  end

  area = 0.25 * sqrt ( area );

  return
end
