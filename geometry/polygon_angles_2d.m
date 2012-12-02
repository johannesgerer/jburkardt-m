function angle = polygon_angles_2d ( n, v )

%*****************************************************************************80
%
%% POLYGON_ANGLES_2D computes the interior angles of a polygon in 2D.
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
  dim_num = 2;

  if ( n <= 2 )
    angle(1:n,1) = 0.0
    return
  end

  for i = 1 : n

    im1 = i4_wrap ( i - 1, 1, n );
    ip1 = i4_wrap ( i + 1, 1, n );

    angle(i,1) = angle_rad_2d ( v(1:dim_num,im1), v(1:dim_num,i), ...
      v(1:dim_num,ip1) );

  end

  return
end
