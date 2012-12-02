function bsv_test01 ( )

%*****************************************************************************80
%
%% BSV_TEST01 tests BSV on a simple example of the Burgers equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST01:\n' );
  fprintf ( 1, '  Solution of steady viscous Burgers equation.\n' );

  a = -1.0;
  b = +1.0;
  alpha = 1.0;
  beta = -1.0;
  nu = 0.1;
  n = 21;
  output = 1;

  u = bsv ( a, b, alpha, beta, nu, n, output );

  x = linspace ( a, b, n );

  figure ( 1 )
  hold on
  plot ( x, u, 'b-', 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'Solution of steady viscous Burgers equation' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, 1.1 * beta, 1.1 * alpha ] )
  hold off
  filename = 'bsv_test01.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "%s".\n', filename );

  x0 = bsv_crossing ( a, b, n, x, u );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U(X0) = 0 estimated at X0 = %g\n', x0 );

  return
end
