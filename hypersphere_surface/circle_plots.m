function circle_plots ( )

%*****************************************************************************80
%
%% CIRCLE_PLOTS plots the surface and the R(Theta) function for a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_PLOTS:\n' );
  fprintf ( 1, '  For a 2D circle defined by a 0/1 characteristic function,\n' );
  fprintf ( 1, '  plot the surface, and R(Theta),\n' );
  fprintf ( 1, '  using a centered point, and then an offcentered point.\n' );
%
%  1): Plot the surface, using a centered base point.
%
  n = 61;
  theta = linspace ( 0.0, 2.0 * pi, n );

  f = zeros(n,1);
  x0 = [ 0.0, 0.0 ];
  for i = 1 : n
    r(i) = bisect_characteristic ( x0, theta(i), @circle_characteristic );
  end
  x = x0(1) + r(1:n) .* cos ( theta(1:n) );
  y = x0(2) + r(1:n) .* sin ( theta(1:n) );

  xc = x0(1) + 0.5 .* cos ( theta(1:n) );
  yc = x0(2) + 0.5 .* sin ( theta(1:n) );

  clf
  hold on
  plot ( x0(1), x0(2), 'b.', 'MarkerSize', 50 );
  plot ( xc, yc, 'b-', 'LineWidth', 2 );
  plot ( x, y, 'r-', 'LineWidth', 3 );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 24 );
  ylabel ( '<---Y--->', 'FontSize', 24 );
  title ( 'Circle transition surface', 'FontSize', 24)
  hold off
  filename =  'circle_centered_surface.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  2): Plot R as a function of Theta for a centered base point.
%
  plot ( theta, r, 'LineWidth', 3 );
  axis ( [theta(1), theta(n), 0.0, 2.0 ] );
  xlabel ( '<---Theta--->', 'FontSize', 24 )
  ylabel ( '<---R(Theta)--->', 'FontSize', 24 )
  title ( 'R(Theta) from base point to surface', 'FontSize', 24 )
  grid on
  filename = 'circle_centered_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  3): Plot the surface, using an offcentered base point.
%
  n = 61;
  theta = linspace ( 0.0 , 2.0 * pi, n );

  f = zeros(n,1);
  x0 = [ 0.3, 0.6 ];
  for i = 1 : n
    r(i) = bisect_characteristic ( x0, theta(i), @circle_characteristic );
  end

  x = x0(1) + r(1:n) .* cos ( theta(1:n) );
  y = x0(2) + r(1:n) .* sin ( theta(1:n) );
%
%  Coordinates of nominal circle around (x0,y0), to
%  suggest coordinate system.
%
  xc = x0(1) + 0.5 .* cos ( theta(1:n) );
  yc = x0(2) + 0.5 .* sin ( theta(1:n) );

  clf
  hold on
  plot ( x0(1), x0(2), 'b.', 'MarkerSize', 50 );
  plot ( xc, yc, 'b-', 'LineWidth', 2 );
  plot ( x, y, 'r-', 'LineWidth', 3 );
  axis equal
  grid on
  xlabel ( '<---X--->', 'FontSize', 24 );
  ylabel ( '<---Y--->', 'FontSize', 24 );
  title ( 'Circle transition surface', 'FontSize', 24 )
  hold off
  filename = 'circle_offcentered_surface.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );
%
%  4): Plot R as a function of Theta for an offcentered base point.
%
  plot ( theta, r, 'LineWidth', 3 );
  axis ( [theta(1), theta(n), 0.0, 2.0 ] );
  xlabel ( '<---Theta--->', 'FontSize', 24 )
  ylabel ( '<---R(Theta)--->', 'FontSize', 24 )
  title ( 'R(Theta) from base point to surface', 'FontSize', 24 )
  grid on
  filename = 'circle_offcentered_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plotfile "%s".\n', filename );

  return
end
