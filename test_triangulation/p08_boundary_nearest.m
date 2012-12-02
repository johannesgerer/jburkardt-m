function boundary = p08_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P08_BOUNDARY_NEAREST returns a nearest boundary point in problem 08.
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
  c1 = [ 0.0, 0.0 ];
  c2 = [ 0.6, 0.0 ];
  r1 = 1.0;
  r2 = 0.1;
  theta1 = pi / 12.0;
  v1 = [ ...
    0.995435619, -0.095435619;   ...
    0.9,          0.0;           ...
    0.96592581,  -0.25881904;    ...
    0.0,          0.0D+00 ]';
  v2 = [...
    0.9,          0.0;         ...
    0.995435619,  0.095435619; ...
    0.0,          0.0;         ...
    0.96592581,  -0.25881904 ]';

  a = ( sqrt ( 119.0 ) - 9.0 ) / 20.0;
  theta2 = atan2 ( a, a + 0.9 );

  for j = 1 : n

    dist_min = inf;
    boundary(1:m,j) = 0.0;
%
%  Compute the distances to the line segments that form four sides
%  of the outer boundary.
%
    for k = 1 : 4

      [ pn, dist, t ] = segment_point_near_2d ( v1(1:2,k)', v2(1:2,k)', ...
        point(1:2,j)' );

      if ( dist < dist_min )
        dist_min = dist;
        boundary(1:2,j) = pn(1:2)';
      end

    end
%
%  Compute the distances to the two arc segments that form two sides
%  of the outer boundary.
%
    [ pn, dist ] = circle_arc_point_near_2d ( r1, c1, -theta1, ...
      -theta2, point(1:2,j)' );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end

    [ pn(1:2), dist ] = circle_arc_point_near_2d ( r1, c1, theta2, ...
      theta1, point(1:2,j)' );

   if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end
%
%  Compute distance to the circle that forms the inner boundary.
%
    [ pn(1:2), dist ] = circle_imp_point_near_2d ( r2, c2, point(1:2,j)' );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end

  end

  return
end
