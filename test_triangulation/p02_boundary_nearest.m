function boundary = p02_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P02_BOUNDARY_NEAREST returns a nearest boundary point in problem 02.
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
%    Input, real POINT(M,N), the coordinates 
%    of the points.
%
%    Output, real BOUNDARY(M,N), points on the boundary
%    that are nearest to each point.
%
  center = [ 0.0, 0.0 ];
  r1 = 1.0;
  r2 = 0.4;

  for j = 1 : n

    if ( point(1:2,j) == center(1:2)' )

      boundary(1,j) = r2;
      boundary(2,j) = center(2);

    else

      r = sqrt ( ( point(1,j) - center(1) ).^2 ...
               + ( point(2,j) - center(2) ).^2 );

      if ( r1 - r < r - r2 )
        boundary(1,j) = center(1) + r1 * ( point(1,j) - center(1) ) / r;
        boundary(2,j) = center(2) + r1 * ( point(2,j) - center(2) ) / r;
      else
        boundary(1,j) = center(1) + r2 * ( point(1,j) - center(1) ) / r;
        boundary(2,j) = center(2) + r2 * ( point(2,j) - center(2) ) / r;
      end

    end

  end

  return
end
