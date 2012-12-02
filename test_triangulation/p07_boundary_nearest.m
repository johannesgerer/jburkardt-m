function boundary = p07_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P07_BOUNDARY_NEAREST returns a nearest boundary point in problem 07.
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
  for j = 1 : n

    x = point(1,j);
    y = point(2,j);
%
%  Examine the upper boundary.
%
%  X can be used as the parameter.
%  The upper boundary can be broken into three parts.  Determine which one
%  we are to look at.
%
    if ( x <= -pi )
      x1 = -2.5 * pi;
      x2 = - pi;
    elseif ( x <= pi )
      x1 = - pi;
      x2 =   pi;
    else
      x1 =   pi;
      x2 =   2.5 * pi;
    end

    status = 0;
    dstar1 = 0.0;

    while ( 1 )

      [ x1, x2, xstar, status ] = fmin_rc ( x1, x2, status, dstar1 );

      ystar = cos ( xstar );

      if ( status == 0 )
        break
      end

      dstar1 = ( x - xstar ).^2 + ( y - ystar ).^2;

    end

    boundary(1:2,j) = [ xstar, ystar ]';
%
%  Examine the lower boundary.
%
    x1 = -2.5 * pi;
    x2 =  2.5 * pi;

    status = 0;
    dstar2 = 0.0;

    while ( 1 )

      [ x1, x2, xstar, status ] = fmin_rc ( x1, x2, status, dstar2 );

      ystar = 5.0 * ( xstar / ( 2.5 * pi ) ).^4 - 5.0;

      if ( status == 0 )
        break
      end

      dstar2 = ( x - xstar ).^2 + ( y - ystar ).^2;

    end

    if ( dstar2 < dstar1 )
      boundary(1:2,j) = [ xstar, ystar ]';
    end

  end

  return
end
