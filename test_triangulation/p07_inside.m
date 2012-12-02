function inside = p07_inside ( m, n, point )

%*****************************************************************************80
%
%% P07_INSIDE reports if a point is inside the region in problem 07.
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
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  inside(1:n) = 1;

  [ lo, hi ] = p07_box ( m );
%
%  Check whether points are in the bounding box.
%
  for j = 1 : n

    for i = 1 : m
      if ( point(i,j) < lo(i) | hi(i) < point(i,j) )
        inside(j) = 0;
        continue
      end

    end

  end
%
%  Check whether points in the bounding box are in the region.
%
  for j = 1 : n

    if ( ~inside(j) )
      continue
    end

    if ( cos ( point(1,j) ) < point(2,j) )
      inside(j) = 0;
      continue
    end

    if ( point(2,j) < -5.0 + 5.0 * point(1,j)^4 / ( 2.5 * pi )^4 )
      inside(j) = 0;
      continue
    end

  end

  return
end
