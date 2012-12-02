function value = triangle_orientation_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ORIENTATION_2D determines the orientation of a triangle in 2D.
%
%  Discussion:
%
%    Three distinct non-colinear points in the plane define a circle.
%    If the points are visited in the order P1, P2, and then
%    P3, this motion defines a clockwise or counterclockwise
%    rotation along the circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, integer VALUE, reports if the three points lie
%    clockwise on the circle that passes through them.  The possible
%    return values are:
%    0, the points are distinct, noncolinear, and lie counterclockwise
%    on their circle.
%    1, the points are distinct, noncolinear, and lie clockwise
%    on their circle.
%    2, the points are distinct and colinear.
%    3, at least two of the points are identical.
%
  dim_num = 2;

  if ( all ( t(1:dim_num,1) == t(1:dim_num,2) ) | ...
       all ( t(1:dim_num,2) == t(1:dim_num,3) ) | ...
       all ( t(1:dim_num,3) == t(1:dim_num,1) ) ) 
    value = 3;
    return
  end

  det = ( t(1,1) - t(1,3) ) * ( t(2,2) - t(2,3) ) ...
      - ( t(1,2) - t(1,3) ) * ( t(2,1) - t(2,3) );

  if ( det == 0.0 )
    value = 2;
  elseif ( det < 0.0 )
    value = 1;
  elseif ( 0.0 < det )
    value = 0;
  end

  return
end
