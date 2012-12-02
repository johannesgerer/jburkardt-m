function boundary = p09_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P09_BOUNDARY_NEAREST returns a nearest boundary point in problem 04.
%
%  Discussion:
%
%    The given input point need not be inside the region.
%
%    In some cases, more than one boundary point may be "nearest",
%    but only one will be returned.
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
%    Output, real BOUNDARY(M,N), points on the boundary
%    that are nearest to each point.
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
    v2(1,j) = center2(1) + r2 * cos ( angle );
    v2(2,j) = center2(2) + r2 * sin ( angle );
  end

  for j = 1 : 6
    angle = ( ( j - 1 ) * 2 ) * pi / 6.0;
    v3(1,j) = center3(1) + r3 * cos ( angle );
    v3(2,j) = center3(2) + r3 * sin ( angle );
  end

  for j = 1 : n

    dist_min = r8_huge ( );
    boundary(1:m,j) = 0.0;
%
%  Examine points on the outer square.
%
    k = 4;

    for i = 1 : 4

      [ pn, dist, t ] = segment_point_near_2d ( v1(1:2,k)', v1(1:2,i)', point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

      k = i;

    end
%
%  Examine points on the first hexagon.
%
    k = 6;

    for i = 1 : 6

      [ pn, dist, t ] = segment_point_near_2d ( v2(1:2,k)', v2(1:2,i)', point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

      k = i;

    end
%
%  Examine points on the second hexagon.
%
    k = 6;

    for i = 1 : 6

      [ pn, dist, t ] = segment_point_near_2d ( v3(1:2,k)', v3(1:2,i)', point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

      k = i;

    end

  end

  return
end

