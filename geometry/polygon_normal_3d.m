function normal = polygon_normal_3d ( n, v )

%*****************************************************************************80
%
%% POLYGON_NORMAL_3D computes the normal vector to a polygon in 3D.
%
%  Discussion:
%
%    If the polygon is planar, then this calculation is correct.
%
%    Otherwise, the normal vector calculated is the simple average
%    of the normals defined by the planes of successive triples
%    of vertices.
%
%    If the polygon is "almost" planar, this is still acceptable.
%    But as the polygon is less and less planar, so this averaged normal
%    vector becomes more and more meaningless.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paulo Cezar Pinto Carvalho and Paulo Roma Cavalcanti,
%    Point in Polyhedron Testing Using Spherical Polygons,
%    in Graphics Gems V,
%    edited by Alan Paeth,
%    Academic Press, 1995, T385.G6975.
%
%  Parameters:
%
%    Input, integer N, the number of vertices.
%
%    Input, real V(3,N), the coordinates of the vertices.
%
%    Output, real NORMAL(3,1), the averaged normal vector
%    to the polygon.
%
  normal = zeros ( 3, 1 );

  v1(1:3,1) = v(1:3,2) - v(1:3,1);

  for j = 3 : n

    v2(1:3,1) = v(1:3,j) - v(1:3,1);

    p = r8vec_cross_product_3d ( v1, v2 );

    normal(1:3,1) = normal(1:3,1) + p(1:3,1);

    v1(1:3,1) = v2(1:3,1);

  end
%
%  Normalize.
%
  normal_norm = norm ( normal );

  if ( normal_norm == 0.0 )
    return
  end

  normal(1:3,1) = normal(1:3,1) / normal_norm;

  return
end
