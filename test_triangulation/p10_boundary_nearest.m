function boundary = p10_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P10_BOUNDARY_NEAREST returns a nearest boundary point in problem 10.
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
  x1 =  0.0;
  x2 = +1.0;
  y1 =  0.0;
  y2 = +1.0;

  for j = 1 : n

    if ( point(1,j) <= x1 )

      if ( point(2,j) <= y1 )
        boundary(1,j) = x1;
        boundary(2,j) = y1;
      elseif ( point(2,j) <= y2 )
        boundary(1,j) = x1;
        boundary(2,j) = point(2,j);
      elseif ( y2 < point(2,j) )
        boundary(1,j) = x1;
        boundary(2,j) = y2;
      end

    elseif ( point(1,j) <= x2 )

      if ( point(2,j) <= y1 )
        boundary(1,j) = point(1,j);
        boundary(2,j) = y1;
      elseif ( point(2,j) <= y2 )

        temp = min ( point(1,j) - x1, ...
               min ( x2 - point(1,j), ...
               min ( point(2,j) - y1, y2 - point(2,j) ) ) );

        if ( point(1,j) - x1 == temp )
          boundary(1,j) = x1;
          boundary(2,j) = point(2,j);
        elseif ( point(2,j) - y1 == temp  )
          boundary(1,j) = point(1,j);
          boundary(2,j) = y1;
        elseif ( x2 - point(1,j) == temp  )
          boundary(1,j) = x2;
          boundary(2,j) = point(2,j);
        elseif ( y2 - point(1,j) == temp  )
          boundary(1,j) = point(1,j);
          boundary(2,j) = y2;
        end

      elseif ( y2 < point(2,j) )
        boundary(1,j) = point(1,j);
        boundary(2,j) = y2;
      end

    elseif ( x2 < point(1,j) )

      if ( point(2,j) <= y1 )
        boundary(1,j) = x2;
        boundary(2,j) = y1;
      elseif ( point(2,j) <= y2 )
        boundary(1,j) = x2;
        boundary(2,j) = point(2,j);
      elseif ( y2 < point(2,j) )
        boundary(1,j) = x2;
        boundary(2,j) = y2;
      end

    end

  end

  return
end
