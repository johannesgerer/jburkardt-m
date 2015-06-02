function naca_test01 ( )

%*****************************************************************************80
%
%% NACA_TEST01 tests NACA4_SYMMETRIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NACA_TEST01\n' );
  fprintf ( 1, '  NACA4_SYMMETRIC evaluates y(x) for a NACA\n' );
  fprintf ( 1, '  symmetric airfoil defined by a 4-digit code.\n' );

  c = 10.0;
  t = 0.15;
  n = 51;
  x = linspace ( 0.0, c, n );
  y = naca4_symmetric ( t, c, x );
%
%  Plot the wing surface.
%
  plot ( x, y, 'b-', ...
         x(n:-1:1), -y(n:-1:1), 'b-', ...
         'Linewidth', 3 );

  axis equal
  grid on
  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  title ( 'NACA 4-digit symmetric airfoil', 'Fontsize', 24 );

  filename = 'symmetric.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics saved in file "%s"\n', filename );
%
%  Save it to a file in counterclockwise order.
%
  xy = [ x, x(n:-1:1); -y, y(n:-1:1) ];
  filename = 'symmetric_data.txt';
  r8mat_write ( filename, 2, 2 * n, xy );
  fprintf ( 1, '  Data saved in file "%s"\n', filename );

  return
end

