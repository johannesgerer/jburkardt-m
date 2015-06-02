function figure_num = edge_test04 ( figure_num )

%*****************************************************************************80
%
%% EDGE_TEST04 plots slices of a 3D function.
%
%  Discussion:
%
%    Although the slice plots look uninteresting, there is a lot of detail
%    hidden in the data in variations that are not obvious at first.
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
%    Larry Shepp,
%    Computerized tomography and nuclear magnetic resonance,
%    Journal of Computer Assisted Tomography,
%    Volume 4, Number 1, February 1980, pages 94-107.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST04:\n' );
  fprintf ( 1, '  Plot 3D test function #1, the Shepp Logan 3D phantom.\n' );

  n = 51;
  x = linspace ( -1.5, +1.5, n );
  y = linspace ( -1.5, +1.5, n );
  z = linspace ( -1.5, +1.5, n );
  [X,Y,Z] = meshgrid ( x, y, z );
  V = fxyz1 ( n * n * n, X, Y, Z );

  figure_num = figure_num + 1;
  figure ( figure_num )
  slice ( X, Y, Z, V, 0.0, [], [] )
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Y --->' )
  zlabel ( '<--- Z --->' )
  title ( 'Slice X = 0.0' )
  axis equal
  filename = 'edge_test04_x.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  figure_num = figure_num + 1;
  figure ( figure_num )
  slice ( X, Y, Z, V, [], +0.0, [] )
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Y --->' )
  zlabel ( '<--- Z --->' )
  title ( 'Slice Y = 0.0' )
  axis equal
  filename = 'edge_test04_y.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  figure_num = figure_num + 1;
  figure ( figure_num )
  slice ( X, Y, Z, V, [], [], -0.1 )
  xlabel ( '<--- X --->' )
  ylabel ( '<--- Y --->' )
  zlabel ( '<--- Z --->' )
  title ( 'Slice Z = -0.1' )
  axis equal
  filename = 'edge_test04_z.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created graphics file "%s".\n', filename );

  return
end
