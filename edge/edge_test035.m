function figure_num = edge_test035 ( figure_num )

%*****************************************************************************80
%
%% EDGE_TEST035 plots a function with a jump discontinuity along a circle.
%
%  Discussion:
%
%    This is example 3.2 in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Determining the locations and discontinuities in the derivatives
%    of functions,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 577-592.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST035:\n' );
  fprintf ( 1, '  Plot 2D test function #3, the modified 2D Harten function.\n' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 10000;
  x = 2.0 * rand ( n, 1 ) - 1.0;
  y = 2.0 * rand ( n, 1 ) - 1.0;
  tri = delaunay ( x, y );
  z = fxy3 ( n, x, y );
  trimesh ( tri, x, y, z, 'FaceColor', 'Interp', 'EdgeColor', 'None' );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<--- Z(X,Y) --->' );
  title ( '2D test function #3, modified 2D Harten function.' );
  view ( -30.0, 75.0 );
  colorbar

  filename = 'edge_test035.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end

