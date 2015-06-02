function [ area, normal ] = polygon_area_3d ( n, v )

%*****************************************************************************80
%
%% POLYGON_AREA_3D computes the area of a polygon in 3D.
%
%  Discussion:
%
%    The computation is not valid unless the vertices of the polygon
%    lie in a plane, so that the polygon that is defined is "flat".
%
%    The polygon does not have to be "regular", that is, neither its
%    sides nor its angles need to be equal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Allen Van Gelder,
%    Efficient Computation of Polygon Area and Polyhedron Volume,
%    Graphics Gems V,
%    edited by Alan Paeth,
%    AP Professional, 1995.
%
%  Parameters:
%
%    Input, integer N, the number of vertices.
%
%    Input, real V(3,N), the coordinates of the vertices.
%    The vertices should be listed in neighboring order.
%
%    Output, real AREA, the area of the polygon.
%
%    Output, real NORMAL(3,1), the unit normal vector to the polygon.
%
  normal(1:3,1) = 0.0;

  for i = 1 : n

    if ( i < n )
      ip1 = i + 1;
    else
      ip1 = 1;
    end
%
%  Compute the cross product vector.
%
    cross(1,1) = v(2,i) * v(3,ip1) - v(3,i) * v(2,ip1);
    cross(2,1) = v(3,i) * v(1,ip1) - v(1,i) * v(3,ip1);
    cross(3,1) = v(1,i) * v(2,ip1) - v(2,i) * v(1,ip1);

    normal(1:3,1) = normal(1:3,1) + cross(1:3,1);

  end

  area = sqrt ( sum ( normal(1:3,1).^2 ) );

  if ( area ~= 0.0 )
    normal(1:3,1) = normal(1:3,1) / area;
  else
    normal(1:3,1) = 1.0 / sqrt ( 3.0 );
  end

  area = 0.5 * area;

  return
end
