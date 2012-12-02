function bsv_test04 ( )

%*****************************************************************************80
%
%% BSV_TEST04 varies the location of the left boundary A in the Burgers equation.
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
  fprintf ( 1, 'BSV_TEST04:\n' );
  fprintf ( 1, '  Solution of steady viscous Burgers equation.\n' );
  fprintf ( 1, '  Vary the left boundary location A around the value -1.\n' );

  a_test = [ -1.04, -1.02, -1.01, -1.005, -1.0, -0.995, -0.99, -0.98, -0.96 ];
  test_num = length ( a_test );
  b = +1.0;
  alpha = 1.0;
  beta = -1.0;
  nu = 0.1;
  n = 161;
  output = 0;

  u = zeros(n,test_num);

  fprintf ( 1, '\n' );

  for test = 1 : test_num

    a = a_test(test);

    fprintf ( 1, '  Using A = %g\n', a );

    u(:,test) = bsv ( a, b, alpha, beta, nu, n, output );

  end

  x = linspace ( a, b, n );

  figure ( 4 )
  clf
  hold on
  plot ( x, u, 'b-', 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'A = -1.04, -1.02, -1.01, -1.005, -1, -0.995, -0.99, -0.98, -0.96' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, -1.5, alpha ] )
  hold off
  filename = 'bsv_test04.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "%s".\n', filename );

  return
end
