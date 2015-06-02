function naca_test02 ( m, p, t )

%*****************************************************************************80
%
%% NACA_TEST02 tests NACA4_CAMBERED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real M, the maximum camber.
%    0 < M.
%
%    Input, real P, the location of maximum camber.
%    0.0 < P < 1.0.
%
%    Input, real T, the maximum relative thickness.
%    0.0 < T <= 1.0.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NACA_TEST02\n' );
  fprintf ( 1, '  NACA4_CAMBERED evaluates (xu,yu) and (xl,yl) for a NACA\n' );
  fprintf ( 1, '  cambered airfoil defined by a 4-digit code.\n' );

  if ( nargin < 1 )
    m = 0.02;
  end

  if ( nargin < 2 )
    p = 0.4;
  end

  if ( nargin < 3 )
    t = 0.12;
  end

  c = 10.0;
  n = 51;

  xc = linspace ( 0.0, c, n );
  [ xu, yu, xl, yl ] = naca4_cambered ( m, p, t, c, xc );
%
%  Plot the wing surface.
%
  plot ( xu, yu, 'b-', ...
         xl(n:-1:1), yl(n:-1:1), 'b-', ...
         'Linewidth', 3 );

  axis equal
  grid on
  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  title ( 'NACA 4-digit cambered airfoil', 'Fontsize', 24 );

  filename = 'cambered.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Graphics saved in file "%s"\n', filename );
%
%  Save it to a file.  List the points in counter clockwise order.
%
  xy = [ xl, xu(n:-1:1); yl, yu(n:-1:1) ];
  filename = 'cambered_data.txt';
  r8mat_write ( filename, 2, 2 * n, xy );
  fprintf ( 1, '  Data saved in file "%s"\n', filename );

  return
end

