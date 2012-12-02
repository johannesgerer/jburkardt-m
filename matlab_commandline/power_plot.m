%% POWER_PLOT plots some random data to a PNG file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_PLOT\n' );
  fprintf ( 1, '  Plot some data, store it in a PNG file.\n' );

  n = 200;
  x = 1 : n;
  y = 2 * rand ( 1, n ) - 1;
  y = sign ( y ) .* y.^2;
  y = cumsum ( y, 2 );
  plot ( x, y );

  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( 'Power\_Plot', 'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  print -dpng 'power_plot.png';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was stored in "power_plot.png".\n' );

  exit
