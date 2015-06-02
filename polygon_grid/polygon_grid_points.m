function xg = polygon_grid_points ( n, nv, v, ng )

%*****************************************************************************80
%
%% POLYGON_GRID_POINTS computes points on a polygonal grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, integer NV, the number of vertices in the polygon.
%
%    Input, real V[NV,2], the coordinates of the vertices.
%
%    Input, integer NG, the number of grid points.
%
%    Output, real XG[NG,2], the coordinates of the grid points.
%
  xg = zeros ( ng, 2 );
%
%  Determine the centroid, and use it as the first grid point.
%
  p = 1;
  vc(1,1) = sum ( v(1:nv,1) ) / nv;
  vc(1,2) = sum ( v(1:nv,2) ) / nv;
  xg(p,1:2) = vc(1,1:2);
  fprintf ( 1, '  %2d  %2d  %2d  %2d  %10.4f %10.4f\n', p, 0, 0, n, xg(p,1:2) )
%
%  Consider each triangle formed by two consecutive vertices and the centroid,
%  but skip the first line of points.
%
  for l = 1 : nv
    lp1 = mod ( l, nv ) + 1;
    for i = 1 : n
      for j = 0 : n - i
        k = n - i - j;
        p = p + 1;
        xg(p,1:2) = ( i * v(l,1:2) + j * v(lp1,1:2) + k * vc(1,1:2) ) / n;
        fprintf ( 1, '  %2d  %2d  %2d  %2d  %10.4f %10.4f\n', p, i, j, k, xg(p,1:2) )
      end
    end

  end

  return
end
