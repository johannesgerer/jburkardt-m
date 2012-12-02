function bsv_test03 ( )

%*****************************************************************************80
%
%% BSV_TEST03 varies the left boundary value ALPHA in the Burgers equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST03:\n' );
  fprintf ( 1, '  Solution of steady viscous Burgers equation.\n' );
  fprintf ( 1, '  Vary the left boundary condition ALPHA around the value +1.\n' );

  a = -1.0;
  b = +1.0;
  alpha_test = [ 0.96, 0.98, 0.99, 0.995, 1.0, 1.005, 1.010, 1.02, 1.04 ];
  beta = -1.0;
  nu = 0.1;
  test_num = length ( alpha_test );
  n = 161;
  output = 0;

  u = zeros(n,test_num);

  fprintf ( 1, '\n' );

  for test = 1 : test_num

    alpha = alpha_test(test);

    fprintf ( 1, '  Using ALPHA = %g\n', alpha );

    u(:,test) = bsv ( a, b, alpha, beta, nu, n, output );

  end

  x = linspace ( a, b, n );

  figure ( 3 )
  clf
  hold on
  plot ( x, u, 'b-', 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'ALPHA = 0.96, 0.98, 0.99, 0.995, 1, 1.005, 1.01, 1.02, 1.04' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, -1.5, alpha ] )
  hold off
  filename = 'bsv_test03.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "%s".\n', filename );

  return
end
