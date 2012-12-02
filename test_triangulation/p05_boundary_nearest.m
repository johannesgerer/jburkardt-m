function boundary = p05_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P05_BOUNDARY_NEAREST returns a nearest boundary point in problem 05.
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
  center1 = [  0.0, 0.0 ];
  center2 = [ -0.4, 0.0 ];
  r1 = 1.0;
  r2 = 0.55;

  for j = 1 : n

    dist_min = r8_huge ( );
%
%  Distance to the semicircle #1.
%
    if ( center1(2) <= point(2,j) )

      norm = sqrt ( ( point(1,j) - center1(1) ).^2 ...
                  + ( point(2,j) - center1(2) ).^2 );

      if ( 0.0 == norm )

        pn(1) = center1(1) + r1 * sqrt ( 0.5 );
        pn(2) = center1(2) + r1 * sqrt ( 0.5 );

      else

        pn(1) = center1(1) + ( point(1,j) - center1(1) ) / norm;
        pn(2) = center1(2) + ( point(2,j) - center1(2) ) / norm;

      end

    elseif ( point(1,j) <= center1(1) )

      pn(1) =  center1(1) - r1;
      pn(2) =  center1(2);

    elseif ( center1(1) <= point(1,j) )

      pn(1) =  center1(1) + r1;
      pn(2) =  center1(2);

    end

    dist = sqrt ( ( point(1,j) - pn(1) ).^2 + ( point(2,j) - pn(2) ).^2 );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end
%
%  Distance to semicircle #2.
%
    if ( center2(2) <= point(2,j) )

      norm = sqrt ( ( point(1,j) - center2(1) ).^2 ...
                  + ( point(2,j) - center2(2) ).^2 );

      if ( 0.0 == norm )

        pn(1) = center2(1) + r2 * sqrt ( 0.5 );
        pn(2) = center2(2) + r2 * sqrt ( 0.5 );

      else

        pn(1) = center2(1) + ( point(1,j) - center2(1) ) / norm;
        pn(2) = center2(2) + ( point(2,j) - center2(2) ) / norm;

      end

    elseif ( point(1,j) <= center2(1) )

      pn(1) =  center2(1) - r2;
      pn(2) =  center2(2);

    elseif ( center2(1) <= point(1,j) )

      pn(1) =  center2(1) + r2;
      pn(2) =  center2(2);

    end

    dist = sqrt ( ( point(1,j) - pn(1) ).^2 + ( point(2,j) - pn(2) ).^2 );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end
%
%  Distance to line segment #1: (P1,P2).
%
    p1(1:2) = [ center2(1) - r1, center2(1) ];
    p2(1:2) = [ center2(1) - r2, center2(2) ];

    [ pn, dist, t ] = segment_point_near_2d ( p1, p2, point(1:2,j)' );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end
%
%  Distance to line segment #2: (Q1,Q2).
%
    q1(1:2) = [ center2(1) + r2, center2(2) ];
    q2(1:2) = [ center1(1) + r1, center1(2) ];

    [ pn, dist, t ] = segment_point_near_2d ( q1, q2, point(1:2,j)' );

    if ( dist < dist_min )
      dist_min = dist;
      boundary(1:2,j) = pn(1:2)';
    end

  end

  return
end
