function angle = polygon_angles ( n, v )

%*****************************************************************************80
%
%% POLYGON_ANGLES computes the interior angles of a polygon.
%
%  Discussion:
%
%    The vertices should be listed in counterclockwise order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of vertices of the polygon.
%
%    Input, real V(2,N), the vertices.
%
%    Output, real ANGLE(N,1), the angles of the polygon,
%    in radians.
%
  if ( n <= 2 )
    angle(1:n,1) = 0.0
    return
  end

  for i = 1 : n

    im1 = i4_wrap ( i - 1, 1, n );
    ip1 = i4_wrap ( i + 1, 1, n );

    angle(i,1) = angle_rad ( v(1:2,im1), v(1:2,i), v(1:2,ip1) );

  end

  return
end
