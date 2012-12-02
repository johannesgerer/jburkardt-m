function boundary = p04_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P04_BOUNDARY_NEAREST returns a nearest boundary point in problem 04.
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
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
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
  r1 = 1.0;
  r2 = 0.5;

  for i = 0 : 5
    angle = ( 2 * ( i - 1 ) ) * pi / 6.0;
    v1(1,i+1) = r1 * cos ( angle );
    v1(2,i+1) = r1 * sin ( angle );
  end

  for i = 6 : -1 : 1
    angle = ( 2 * i - 1 ) * pi / 6.0;
    v2(1,7-i) = r2 * cos ( angle );
    v2(2,7-i) = r2 * sin ( angle );
  end

  for j = 1 : n

    dist_min = r8_huge ( );
    boundary(1:m,j) = 0.0;
%
%  Examine points on the outer hexagon.
%
    k = 6;

    for i = 1 : 6

      [ pn, dist, t ] = segment_point_near_2d ( ...
        v1(1:2,k)', v1(1:2,i)', point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

      k = i;

    end
%
%  Examine points on the inner hexagon.
%
    k = 6;

    for i = 1 : 6

      [ pn, dist, t ] = segment_point_near_2d ( ...
        v2(1:2,k)', v2(1:2,i)', point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

      k = i;

    end

  end

  return
end
