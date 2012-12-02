function bsv_test08 ( )

%*****************************************************************************80
%
%% BSV_TEST08 compares BSV and BSV_UPWIND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST08:\n' );
  fprintf ( 1, '  Compare BSV and BSV_UPWIND.\n' );
  fprintf ( 1, '  Upwinding is a scheme which reduces the numerical oscillations\n' );
  fprintf ( 1, '  that can occur as the viscosity in the Burgers equation is decreased.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The distortion caused by upwinding is visible for N = 21, NU = 0.1.\n' );

  figure ( 8 )
  clf

  subplot ( 1, 2, 1 );

  a = -1.0;
  b = +1.0;
  alpha = 1.0;
  beta = -1.0;
  nu = 0.1;
  n = 21;
  output = 0;

  u(:,1) = bsv ( a, b, alpha, beta, nu, n, output );
  u(:,2) = bsv_upwind ( a, b, alpha, beta, nu, n, output );

  x = ( linspace ( a, b, n ) )';

  hold on
  plot ( x, u, 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'NU = 0.1, BSV (blue) and BSV\_UPWIND (green)' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, 1.1 * beta, 1.1 * alpha ] )
  hold off
%
%  Repeat for smaller NU.
%
  fprintf ( 1, '  The oscillations caused by NOT upwinding are visible for N = 21, NU = 0.01.\n' );
  subplot ( 1, 2, 2 );

  a = -1.0;
  b = +1.0;
  alpha = 1.0;
  beta = -1.0;
  nu = 0.01;
  n = 21;
  output = 0;

  u(:,1) = bsv ( a, b, alpha, beta, nu, n, output );
  u(:,2) = bsv_upwind ( a, b, alpha, beta, nu, n, output );

  x = ( linspace ( a, b, n ) )';

  hold on
  plot ( x, u, 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'NU = 0.01, BSV (blue) and BSV\_UPWIND (green)' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, 1.1 * beta, 1.1 * alpha ] )
  hold off

  filename = 'bsv_test08.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "%s".\n', filename );

  return
end
