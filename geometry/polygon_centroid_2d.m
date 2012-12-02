function centroid = polygon_centroid_2d ( n, v )

%*****************************************************************************80
%
%% POLYGON_CENTROID_2D computes the centroid of a polygon in 2D.
%
%  Discussion:
%
%    Denoting the centroid coordinates by CENTROID, then
%
%      CENTROID(1) = Integral ( Polygon interior ) x dx dy / Area ( Polygon )
%      CENTROID(2) = Integral ( Polygon interior ) y dx dy / Area ( Polygon ).
%
%    Green's theorem states that for continuously differentiable functions
%    M(x,y) and N(x,y),
%
%      Integral ( Polygon boundary ) ( M dx + N dy ) =
%      Integral ( Polygon interior ) ( dN/dx - dM/dy ) dx dy.
%
%    Using M(x,y) = 0 and N(x,y) = x**2/2, we get:
%
%      CENTROID(1) = 0.5 * Integral ( Polygon boundary ) x**2 dy
%                  / Area ( Polygon ),
%
%    which becomes
%
%      CENTROID(1) = 1/6 sum ( 1 <= I <= N )
%        ( X(I+1) + X(I) ) * ( X(I) * Y(I+1) - X(I+1) * Y(I))
%        / Area ( Polygon )
%
%    where, when I = N, the index "I+1" is replaced by 1.
%
%    A similar calculation gives us a formula for CENTROID(2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gerard Bashein and Paul Detmer,
%    Centroid of a Polygon,
%    Graphics Gems IV,
%    edited by Paul Heckbert,
%    AP Professional, 1994.
%
%  Parameters:
%
%    Input, integer N, the number of sides of the polygon.
%
%    Input, real V(2,N), the coordinates of the vertices.
%
%    Output, real CENTROID(2,1), the coordinates of the centroid.
%
  dim_num = 2;

  area = 0.0;
  centroid(1:dim_num,1) = 0.0;

  for i = 1 : n

    if ( i < n )
      ip1 = i + 1;
    else
      ip1 = 1;
    end

    temp = ( v(1,i) * v(2,ip1) - v(1,ip1) * v(2,i) );

    area = area + temp;

    centroid(1:dim_num,1) = centroid(1:dim_num,1) ...
      + ( v(1:dim_num,ip1) + v(1:dim_num,i) )' * temp;

  end

  area = area / 2.0;

  if ( area == 0.0 )
    centroid(1:dim_num,1) = v(1:dim_num,1);
  else
    centroid(1:dim_num,1) = centroid(1:dim_num,1) / ( 6.0 * area );
  end

  return
end
