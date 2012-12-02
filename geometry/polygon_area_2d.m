function area = polygon_area_2d ( n, v )

%*****************************************************************************80
%
%% POLYGON_AREA_2D computes the area of a polygon in 2D.
%
%  Discussion:
%
%    AREA = 1/2 * abs ( sum ( 1 <= I <= N ) X(I) * ( Y(I+1) - Y(I-1) ) )
%    where Y(0) should be replaced by Y(N), and Y(N+1) by Y(1).
%
%    If the vertices are given in counterclockwise order, the area
%    will be positive.  If the vertices are given in clockwise order,
%    the area will be negative.
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
%    Output, real AREA, the area of the polygon.
%
  area = 0.0;

  for i = 1 : n

    im1 = i4_wrap ( i-1, 1, n );
    ip1 = i4_wrap ( i+1, 1, n );

    area = area + v(1,i) * ( v(2,ip1) - v(2,im1) );

  end

  area = 0.5 * area;

  return
end
