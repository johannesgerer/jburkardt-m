function inside = p09_inside ( m, n, point )

%*****************************************************************************80
%
%% P09_INSIDE reports if a point is inside the region in problem 09.
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
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  center1 = [ 0.50, 0.50 ];
  center2 = [ 0.25, 0.75 ];
  center3 = [ 0.60, 0.40 ];
  r1 = 0.5;
  r2 = 0.1;
  r3 = 0.1;

  v1(1:2,1:4) = [ ...
    center1(1) - r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) - r1; ...
    center1(1) + r1, center1(2) + r1; ...
    center1(1) - r1, center1(2) + r1 ]';

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    v2(1:2,j) = [ center2(1) + r2 * cos ( angle ), ...
                  center2(2) + r2 * sin ( angle ) ]
  end

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    v3(1:2,j) = [ center3(1) + r3 * cos ( angle ), ...
                  center3(2) + r3 * sin ( angle ) ];
  end

  inside(1:n) = 1;

  for j = 1 : n

    if ( point(1,j) < center1(1) - r1 | ...
         center1(1) + r1 < point(1,j) | ...
         point(2,j) < center1(2) - r1 | ...
         center1(2) + r1 < point(2,j) )

      inside(j) = 0;

    elseif ( hexagon_contains_point_2d ( v2, point(1:2,j) ) )

      inside(j) = 0;

    elseif ( hexagon_contains_point_2d ( v3, point(1:2,j) ) )

      inside(j) = 0;

    end

  end

  return
end
