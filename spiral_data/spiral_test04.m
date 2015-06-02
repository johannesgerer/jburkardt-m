function spiral_test04 ( )

%*****************************************************************************80
%
%% SPIRAL_TEST04 generates a field on a regular grid and plots it.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPIRAL_TEST04:\n' );
  fprintf ( 1, '  Generate a spiral velocity field on a regular grid.\n' );
  fprintf ( 1, '  Plot it with Matlab''s QUIVER() command.\n' );

  x_lo = 0.0;
  x_hi = 1.0;
  x_num = 21;

  y_lo = 0.0;
  y_hi = 1.0;
  y_num = 21;

  [ x, y ] = grid_2d ( x_num, x_lo, x_hi, y_num, y_lo, y_hi );

  n = x_num * y_num;
  c = 1.0;

  [ u, v ] = uv_spiral ( n, x, y, c );

  quiver ( x, y, u, v );
  axis ( 'equal' );
  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  title ( 'Spiral Flow Field', 'FontSize', 24 );

  plot_filename = 'spiral_quiver.png';
  print ( '-dpng', plot_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s"\n', plot_filename );

  return
end

