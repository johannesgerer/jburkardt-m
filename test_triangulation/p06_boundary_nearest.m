function boundary = p06_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P06_BOUNDARY_NEAREST returns a nearest boundary point in problem 06.
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

  for j = 1 : n

    x = point(1,j);
    y = point(2,j);

    if ( x == 0.0 & y == 0.0 )

      boundary(1:2,j) = [ r2, 0.0 ]';
%
%  Determine the angle formed by (0,0) and the point.
%
    else

      t = atan4 ( y, x );
%
%  Find the nearest point on the superellipse x^4 + y^4 = 1^4.
%
      t1 = t - pi / 4.0;
      t2 = t + pi / 4.0;

      status = 0;
      dstar1 = 0.0;

      while ( 1 )

        [ t1, t2, tstar1, status ] = fmin_rc ( t1, t2, status, dstar1 );

        if ( status == 0 )
          break
        end

        cm = abs ( cos ( tstar1 ) );
        cs = r8_sign ( cos ( tstar1 ) );
        sm = abs ( sin ( tstar1 ) );
        ss = r8_sign ( sin ( tstar1 ) );

        dstar1 = ( x - r1 * cs * sqrt ( cm ) ).^2 ...
               + ( y - r1 * ss * sqrt ( sm ) ).^2;

      end

      boundary(1,j) = r1 * cs * sqrt ( cm );
      boundary(2,j) = r1 * ss * sqrt ( sm );
%
%  Find the nearest point on the superellipse x^4 + y^4 = 1/2^4.
%
      t1 = t - pi / 4.0;
      t2 = t + pi / 4.0;

      status = 0;
      dstar2 = 0.0;

      while ( 1 )

        [ t1, t2, tstar2, status ] = fmin_rc ( t1, t2, status, dstar2 );

        if ( status == 0 )
          break
        end

        cm = abs ( cos ( tstar2 ) );
        cs = r8_sign ( cos ( tstar2 ) );
        sm = abs ( sin ( tstar2 ) );
        ss = r8_sign ( sin ( tstar2 ) );

        dstar2 = ( x - r2 * cs * sqrt ( cm ) ).^2 ...
               + ( y - r2 * ss * sqrt ( sm ) ).^2;

      end
%
%  Because of some MATLAB idiocy I don't have the patience to figure out,
%  involving SQRT having the wrong number of arguments(!),
%  I must replace the line
%    boundary(1:2,j) = [ r2 * cs * sqrt ( cm ), r2 * ss * sqrt ( sm ) ]';
%
      if ( dstar2 < dstar1 )
        boundary(1,j) = r2 * cs * sqrt ( cm );
        boundary(2,j) = r2 * ss * sqrt ( sm );
      end

    end

  end

  return
end

