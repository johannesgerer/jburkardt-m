function point = p01_boundary_project ( m, n, point )

%*****************************************************************************80
%
%% P01_BOUNDARY_PROJECT projects exterior points to the boundary in problem 01.
%
%  Discussion:
%
%    Points in the interior are not changed.
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
%    Input, real ( kind = 8 ) POINT(M,N), the coordinates 
%    of the points. 
%
%    Output, real ( kind = 8 ) POINT(M,N), all exterior points have been
%    replaced by the nearest point on the boundary.
%
  center = [ 0.0, 0.0 ];
  r1 = 1.0;

  inside = p01_inside ( m, n, point )

  for j = 1 : n

    if ( inside(j) )
      continue
    end

    r = sqrt ( sum ( ( point(1:m,j) - center(1:m) ).^2 ) );

    if ( r == 0.0 )
      point(1,j) = center(1) + r1;
      point(2,j) = center(2);
    else
      point(1:m,j) = center(1:m) ...
        + ( r1 / r ) * ( point(1:m,j) - center(1:m) );
    end

  end

  return
end
