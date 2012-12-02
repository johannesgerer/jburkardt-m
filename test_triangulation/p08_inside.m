function inside = p08_inside ( m, n, point )

%*****************************************************************************80
%
%% P08_INSIDE reports if a point is inside the region in problem 08.
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
%    Input, real POINT(M,N), the coordinates
%    of the points.
%
%    Output, logical INSIDE(N), is TRUE if the point is in the region.
%
  nv = 6;

  c1 = [ 0.0, 0.0 ];
  c2 = [ 0.6, 0.0 ];

  r1 = 1.0;
  r2 = 0.1;
  theta1 = - pi / 12.0;
  theta2 =   pi / 12.0;
%
%  These coordinates are for a square with one corner at (0.9, 0.0),
%  and sides of length 0.2.  It's somewhat bigger than the "bite"
%  it takes out of the piece of pie.
%
  x_poly = [ ...
    0.9000000,  0.0000000, 
    1.0414213, -0.1414213, 
    1.1828427,  0.0000000, 
    1.0414213,  0.1414213 ]';

  inside(1:n) = 0;
  
  for j = 1 : n
%
%  Is the point inside the circular sector?
%
    if ( circle_sector_contains_point_2d ( r1, c1, theta1, theta2, ...
       point(1:2,j) ) )
%
%  Is the point NOT inside the box?
%
      if ( ~polygon_contains_point_2d ( 4, x_poly, point(1:2,j) ) )
%
%  Is the point NOT inside the circle?
%
        if ( ~circle_imp_contains_point_2d ( r2, c2, point(1:2,j) ) )
          inside(j) = 1;
        end
      end
    end

  end

  return
end
