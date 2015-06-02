function polygon_grid_display ( n, nv, v, ng, xg )

%*****************************************************************************80
%
%% POLYGON_GRID_DISPLAY displays grid points inside a polygon.
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
%    Input, real XG(NG,2), the grid points.
%
  clf

  hold on

  plot ( [v(nv,1),v(1,1)], [v(nv,2),v(1,2)], 'r-', 'LineWidth', 2 );
  for i = 1 : nv - 1
    plot ( v(i:i+1,1), v(i:i+1,2), 'r-', 'LineWidth', 2 );
  end
  plot ( v(:,1), v(:,2), 'r.', 'MarkerSize', 25 );

  vc(1,1) = sum ( v(1:nv,1) ) / nv;
  vc(1,2) = sum ( v(1:nv,2) ) / nv;
  for i = 1 : nv
    plot ( [v(i,1),vc(1,1)], [v(i,2),vc(1,2)], 'b-', 'LineWidth', 2 );
  end
  plot ( xg(:,1), xg(:,2), 'b.', 'MarkerSize', 20 );
  axis equal
  title ( sprintf ( 'Polygonal grid, N = %d, NG = %d', n, ng ) )
  grid on
  hold off

  return
end
