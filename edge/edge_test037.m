function figure_num = edge_test37 ( figure_num )

%*****************************************************************************80
%
%% EDGE_TEST037 plots a function with a derivative discontinuity.
%
%  Discussion:
%
%    This is example 3.1 in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2014
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
  fprintf ( 1, 'EDGE_TEST037:\n' );
  fprintf ( 1, '  Plot 2D test function #5, discontinuous medium wave, U(x,t).\n' );

  figure_num = figure_num + 1;
  figure ( figure_num )

  m = 21;
  x = linspace ( -1.0, 0.0, m );
  n = 21;
  y = linspace ( 0.0, 0.1, n );
  [ X, Y ] = meshgrid ( x, y );
  tri = delaunay ( X, Y );
  Z = fxy5 ( m * n, X, Y );
  trimesh ( tri, X, Y, Z, 'FaceColor', 'Interp', 'EdgeColor', 'None' );

  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<--- Z(X,Y) --->' );
  title ( '2D test function #5, discontinuous medium wave, U(x,t).' );
  view ( -30.0, 45.0 );
  colorbar

  filename = 'edge_test037.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end

