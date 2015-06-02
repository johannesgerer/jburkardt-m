function x = triangle_surface_sample ( n, v )

%*****************************************************************************80
%
%% TRIANGLE_SURFACE_SAMPLE maps uniform points onto the surface of a triangle.
%
%  Discussion:
%
%    The triangle is defined by the three vertices V1, V2, V3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real V(2,3), the vertices of the triangle.
%
%    Output, real X(2,N), the points.
%
  if ( nargin < 2 )
    v = [ 0.0, 1.0, 0.0;
          0.0, 0.0, 1.0 ];
  end

  if ( nargin < 1 )
    n = 10;
  end

  m = 2;

  l1 = sqrt ( ( v(1,2) - v(1,1) ) ^ 2 ...
            + ( v(2,2) - v(2,1) ) ^ 2 );

  l2 = sqrt ( ( v(1,3) - v(1,2) ) ^ 2 ...
            + ( v(2,3) - v(2,2) ) ^ 2 );

  l3 = sqrt ( ( v(1,1) - v(1,3) ) ^ 2 ...
            + ( v(2,1) - v(2,3) ) ^ 2 );
  
  x = zeros ( m, n );

  for j = 1 : n
%
%  R can be regarded as the distance of the point on the perimeter,
%  as measured from the origin, along the perimeter.
%
    r = ( l1 + l2 + l3 ) * rand ( 1, 1 );
%
%  Case 1: between V1 and V2.
%
    if ( r <= l1 )

      s = ( l1 - r ) / l1;
      t =        r   / l1;
      x(1,j) = s * v(1,1) + t * v(1,2);
      x(2,j) = s * v(2,1) + t * v(2,2);
%
%  Case 2: between V2 and V3.
%
    elseif ( r <= l1 + l2 )

      s = ( l2 - r + l1 ) / l2;
      t = (      r - l1 ) / l2;
      x(1,j) = s * v(1,2) + t * v(1,3);
      x(2,j) = s * v(2,2) + t * v(2,3);
%
%  Case 3: between V3 and V1.
%
    else

      s = ( l3 - r + l1 + l2 ) / l3;
      t = (      r - l1 - l2 ) / l3;
      x(1,j) = s * v(1,3) + t * v(1,1);
      x(2,j) = s * v(2,3) + t * v(2,1);

    end

  end

  return
end
