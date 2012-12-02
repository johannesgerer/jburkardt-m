function inside = p04_inside ( m, n, point )

%*****************************************************************************80
%
%% P04_INSIDE reports if a point is inside the region in problem 04.
%
%  Discussion:
%
%    Our test asks if a point is inside the big hexagon and not inside
%    the smaller one.  For this test to work, we need to list the
%    vertices of the smaller hexagon in the same counter clockwise order
%    used for the big hexagon.  In other routines, we list the vertices
%    of the inner hexagon in clockwise order, since we think of it 
%    solely as the boundary of the hexagonal annulus.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates 
%    of the points.
%
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  r1 = 1.0;
  r2 = 0.5;
%
%  Drat bast it!  Here, we need to list the V2 vertices in
%  the same order as V1...
%
  for i = 0 : 5
    angle = ( 2 * ( i - 1 ) ) * pi / 6.0;
    v1(1,i+1) = r1 * cos ( angle );
    v1(2,i+1) = r1 * sin ( angle );
  end

  for i = 1 : 6
    angle = ( 2 * i - 1 ) * pi / 6.0;
    v2(1,i) = r2 * cos ( angle );
    v2(2,i) = r2 * sin ( angle );
  end

  for i = 1 : n

    inside(i) = hexagon_contains_point_2d ( v1, point(1:2,i) ) ...
             & ~hexagon_contains_point_2d ( v2, point(1:2,i) );

  end

  return
end
