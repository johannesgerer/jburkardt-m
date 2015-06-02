function figure_num = circle_segment_test03 ( figure_num )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST03 plots some quadrature rules from GQCIRCSEGM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2013
%
%  Author:
%
%    John Burkardt
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST03\n' );
  fprintf ( 1, '  GQCIRCSEGM computes a Gauss quadrature rule for a\n' );
  fprintf ( 1, '  circle segment with circle of radius R and center (0,0),\n' );
  fprintf ( 1, '  with segment angles in [-theta/2,+theta/2].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot some rules.\n' );
  fprintf ( 1, '\n' );
  r = 1.0;
  n = 9;

  theta = pi;

  for a = 0 : 3

    thetah = theta / 2.0;
    an = linspace ( -thetah, thetah, 51 );
    x = r * cos ( an );
    y = r * sin ( an );
    x = [ x, x(1) ];
    y = [ y, y(1) ];

    [ xg, yg, wg ] = gqcircsegm ( n, thetah, r );
    n1 = length ( xg );

    figure_num = figure_num + 1;
    figure ( figure_num );
    clf
    hold on
    plot ( x, y, 'k-' );
    plot ( xg(:), yg(:), 'b.', 'Markersize', 20 );
    grid on
    axis equal
    xlabel ( '<--- X --->' );
    ylabel ( '<--- Y --->' );
    title ( sprintf ( 'Rule of order %d, precision %d', n1, n ) );
    hold off

    filename = sprintf ( 'rule_p%d_t%g.png', n, theta );
    print ( '-dpng', filename );
    fprintf ( 1, '  Created graphics image "%s".\n', filename );

    theta = theta / 2.0;

  end
 
  return
end
