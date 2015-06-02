function figure_num = circle_segment_test12 ( figure_num )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST12 plots rules from CIRCLE_SEGMENT_RULE_FROM_CHORD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2013
%
%  Author:
%
%    John Burkardt
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST12\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_RULE_FROM_CHORD computes a quadrature rule\n' );
  fprintf ( 1, '  for a circle segment of radius R, center C, chord P1:P2,\n' );
  fprintf ( 1, '  algebraic precision P.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot some such rules.\n' );
  fprintf ( 1, '\n' );
%
%  Rule #1
%
  r = 2.0;
  c = [ 1.0; 0.0 ];
  rho1 = pi / 4.0;
  p1 = c + r * [ cos(rho1); sin(rho1) ];
  rho2 = 5.0 * pi / 4.0;
  p2 = c + r * [ cos(rho2); sin(rho2) ];
  p = 9;
  xyw = circle_segment_rule_from_chord ( r, c, p1, p2, p );

  [ n1, n2 ] = size ( xyw );

  figure_num = figure_num + 1;
  figure ( figure_num );
  clf
  hold on

  an = linspace ( rho1, rho2, 51 );
  x = c(1) + r * cos ( an );
  y = c(2) + r * sin ( an );
  x = [ x, x(1) ];
  y = [ y, y(1) ];
  plot ( x, y, 'k-' );
  plot ( xyw(:,1), xyw(:,2), 'b.', 'Markersize', 20 );
  grid on
  axis equal
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Rule of order %d, precision %d', n1, p ) );
  hold off

  filename = 'test12_rule1.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created graphics image "%s".\n', filename );
 %
%  Rule #2
%
  r = 1.5;
  c = [ -1.0; 2.0 ];
  rho1 = 5.0 * pi / 6.0;
  p1 = c + r * [ cos(rho1); sin(rho1) ];
  rho2 = 10.0 * pi / 6.0;
  p2 = c + r * [ cos(rho2); sin(rho2) ];
  p = 13;
  xyw = circle_segment_rule_from_chord ( r, c, p1, p2, p );

  [ n1, n2 ] = size ( xyw );

  figure_num = figure_num + 1;
  figure ( figure_num );
  clf
  hold on

  an = linspace ( rho1, rho2, 51 );
  x = c(1) + r * cos ( an );
  y = c(2) + r * sin ( an );
  x = [ x, x(1) ];
  y = [ y, y(1) ];
  plot ( x, y, 'k-' );
  plot ( xyw(:,1), xyw(:,2), 'b.', 'Markersize', 20 );
  grid on
  axis equal
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Rule of order %d, precision %d', n1, p ) );
  hold off

  filename = 'test12_rule2.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created graphics image "%s".\n', filename );
 
  return
end
