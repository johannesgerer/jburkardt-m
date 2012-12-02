function diameter = polygon_diameter_2d ( n, v )

%*****************************************************************************80
%
%% POLYGON_DIAMETER_2D computes the diameter of a polygon in 2D.
%
%  Discussion:
%
%    The diameter of a polygon is the maximum distance between any
%    two points on the polygon.  It is guaranteed that this maximum
%    distance occurs between two vertices of the polygon.  It is
%    sufficient to check the distance between all pairs of vertices.
%    This is an N^2 algorithm.  There is an algorithm by Shamos which
%    can compute this quantity in order N time instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
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
%    Output, real DIAMETER, the diameter of the polygon.
%
  dim_num = 2;

  diameter = 0.0;

  for i = 1 : n

    for j = i+1 : n
      diameter = max ( diameter, ...
        sqrt ( ( v(1,i) - v(1,j) ).^2 + ( v(2,i) - v(2,j) ).^2 ) );
    end

  end

  return
end
