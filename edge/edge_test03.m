function figure_num = edge_test03 ( figure_num )

%*****************************************************************************80
%
%% EDGE_TEST03 plots a function with a jump discontinuity along a circle.
%
%  Discussion:
%
%    This is example 4.2 in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Polynomial fitting for edge detection in irregularly sampled signals 
%    and images,
%    SIAM Journal on Numerical Analysis,
%    Volume 43, Number 1, 2006, pages 259-279.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST03:\n' );
  fprintf ( 1, '  Plot 2D test function #2, the Shepp Logan phantom.\n' );

  figure_num = figure_num + 1;
  figure ( figure_num )
  n = 10000;
  x = 2.0 * rand ( n, 1 ) - 1.0;
  y = 2.0 * rand ( n, 1 ) - 1.0;
  tri = delaunay ( x, y );
  z = fxy2 ( n, x, y );
  trimesh ( tri, x, y, z, 'FaceColor', 'Interp', 'EdgeColor', 'None' );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<--- Z(X,Y) --->' );
  title ( '2D test function #2, Shepp-Logan phantom function.' );
  view ( -30.0, 75.0 );
  colorbar

  filename = 'edge_test03.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end

