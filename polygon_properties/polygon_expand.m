function w = polygon_expand ( n, v, h )

%*****************************************************************************80
%
%% POLYGON_EXPAND expands a polygon in.
%
%  Discussion:
%
%    This routine simple moves each vertex of the polygon outwards
%    in such a way that the sides of the polygon advance by H.
%
%    This approach should always work if the polygon is convex, or
%    star-shaped.  But for general polygons, it is possible
%    that this procedure, for large enough H, will create a polygon
%    whose sides intersect.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sides of the polygon.
%
%    Input, real V(2,N), the coordinates of the vertices.
%
%    Input, real H, the expansion amount.
%
%    Output, real W(2,N), the "expanded" coordinates.
%

%
%  Consider each angle, formed by the nodes P(I-1), P(I), P(I+1).
%
  for i = 1 : n

    im1 = i4_wrap ( i - 1, 1, n );
    ip1 = i4_wrap ( i + 1, 1, n );
%
%        P1
%        /
%       /   P4
%      /  .
%     / .
%    P2--------->P3
%
    p4(1:2,1) = angle_half ( v(1:2,im1), v(1:2,i), v(1:2,ip1) );
%
%  Compute the value of the half angle.
%
    angle = angle_rad ( v(1:2,im1), v(1:2,i), p4(1:2,1) );
%
%  The stepsize along the ray must be adjusted so that the sides
%  move out by H.
%
    h2 = h / sin ( angle );

    w(1:2,i) = v(1:2,i) - h2 * ( p4(1:2,1) - v(1:2,i) );

  end

  return
end
