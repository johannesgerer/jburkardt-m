function figure_num = circle_segment_test06 ( figure_num )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST06 samples using CIRCLE_SEGMENT_SAMPLE_FROM_HEIGHT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    John Burkardt
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  n = 100;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST06\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_SAMPLE_FROM_HEIGHT samples a circle segment.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot %d points from several segments.\n', n );
  fprintf ( 1, '\n' );

  r = 1.0;
  theta = pi;

  for i = 0 : 3

    h = circle_segment_height_from_angle ( r, theta );

    thetah = theta / 2.0;

    an = 0.5 * pi + linspace ( -thetah, +thetah, 51 );
    x = r * cos ( an );
    y = r * sin ( an );
    x = [ x, x(1) ];
    y = [ y, y(1) ];

    [ xs, ys, seed ] = circle_segment_sample_from_height ( r, h, n, seed );

    figure_num = figure_num + 1;
    figure ( figure_num );
    clf
    hold on
    plot ( x, y, 'k-' );
    plot ( xs, ys, 'b.', 'Markersize', 20 );
    grid on
    axis equal
    xlabel ( '<--- X --->' );
    ylabel ( '<--- Y --->' );
    title ( sprintf ( 'Segment with THETA = %g, R = %g H = %g\n', theta, r, h ) );
    hold off

    filename = sprintf ( 'sample_t%g.png', theta );
    print ( '-dpng', filename );
    fprintf ( 1, '  Created graphics file "%s".\n', filename );

    theta = theta / 2.0;

  end
 
  return
end
