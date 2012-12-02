function boundary = p03_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P03_BOUNDARY_NEAREST returns a nearest boundary point in problem 03.
%
%  Discussion:
%
%    The given input point need not be inside the region.
%
%    In some cases, more than one boundary point may be "nearest",
%    but only one will be returned.
%
%    31 August 2005: Thanks to Hua Fei for pointing out that a previous
%    version of this routine gave inaccurate results for points that were
%    significantly far from the box.
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
%    Input, real POINT(M,N), the points.
%
%    Output, real BOUNDARY(M,N), points on the boundary
%    that are nearest to each point.
%
  center = [ 0.0, 0.0 ];
  r1 = 1.0;
  r2 = 0.4;
  x1 = -1.0;
  x2 = +1.0;
  y1 = -1.0;
  y2 = +1.0;

  for j = 1 : n

    x = point(1,j);
    y = point(2,j);
%
%  Special case: a point at the center of the box.
%  The closest point is ANY point on the circle.
%
    if ( point(1,j) == center(1) & point(2,j) == center(2) )
      boundary(1,j) = center(1) + r2;
      boundary(2,j) = center(2);
      continue
    end
%
%  Is the point to the left of the box?
%
    if ( x <= x1 )

      boundary(1,j) = x1;

      if ( y <= y1 )
        boundary(2,j) = y1;
      elseif ( y <= y2 )
        boundary(2,j) = y;
      elseif ( y2 <= y )
        boundary(2,j) = y2;
      end
%
%  To the right of the box?
%
    elseif ( x2 <= x )

      boundary(1,j) = x2;

      if ( y <= y1 )
        boundary(2,j) = y1;
      elseif ( y <= y2 )
        boundary(2,j) = y;
      elseif ( y2 <= y )
        boundary(2,j) = y2;
      end
%
%  Below the middle of the box?
%
    elseif ( y <= y1 )

      boundary(1,j) = x;
      boundary(2,j) = y1;
%
%  Above the middle of the box?
%
    elseif ( y2 <= y )

      boundary(1,j) = x;
      boundary(2,j) = y2;
%
%  Inside the box.
%  Figure out which side is closest by drawing the diagonal lines.
%
    else
%
%  Y is small.
%
      if (     y <= x &  y <= -x )
        boundary(1,j) = x;
        boundary(2,j) = y1;
%
%  X is big.
%
      elseif ( y <= x & -y <=  x )
        boundary(1,j) = x2;
        boundary(2,j) = y;
%
%  Y is big.
%
      elseif ( x <= y & -x <=  y )
        boundary(1,j) = x;
        boundary(2,j) = y2;
%
%  X is small.
%
      elseif ( x <= y &  x <= -y )
        boundary(1,j) = x1;
        boundary(2,j) = y;
      end
%
%  For points inside the box, the boundary of the circle might be closer than 
%  the boundary of the box.
%
      r = sqrt ( sum ( ( point(1:m,j) - center(1:m)' ).^2 ) );

      dist_circle = abs ( r - r2 );
      dist_box = sqrt ( sum ( ( point(1:m,j) - boundary(1:m,j) ).^2 ) );

      if ( dist_circle <  dist_box )
        boundary(1:m,j) = center(1:m)' + r2 / r * ( point(1:m,j) - center(1:m)' );
      end

    end

  end

  return
end
