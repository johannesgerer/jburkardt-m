function bsv_test02 ( )

%*****************************************************************************80
%
%% BSV_TEST02 varies the viscosity NU in the Burgers equation.
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
  fprintf ( 1, 'BSV_TEST02:\n' );
  fprintf ( 1, '  Solution of steady viscous Burgers equation.\n' );
  fprintf ( 1, '  Consider a variety of values of viscosity nu.\n' );

  a = -1.0;
  b = +1.0;
  alpha = 1.0;
  beta = -1.0;
  nu_test = [ 0.8; 0.4; 0.2; 0.1; 0.05; 0.025 ];
  test_num = length ( nu_test );
  n = 161;
  output = 0;

  u = zeros(n,test_num);

  fprintf ( 1, '\n' );

  for test = 1 : test_num

    nu = nu_test(test);

    fprintf ( 1, '  Using NU = %g\n', nu );

    u(:,test) = bsv ( a, b, alpha, beta, nu, n, output );

  end

  x = linspace ( a, b, n );

  figure ( 2 )
  clf
  hold on
  plot ( x, u, 'b-', 'LineWidth', 3 );
  plot ( [a,b], [0.0,0.0], 'r-', 'LineWidth', 2 )
  grid on
  title ( 'NU = 0.8, 0.4, 0.2, 0.1, 0.05, 0.025' )
  xlabel ( '<--- X --->' )
  ylabel ( '<---U(X) --->' )
  axis ( [ a, b, 1.5 * beta, 1.5 * alpha ] )
  hold off
  print ( '-dpng', 'bsv_test02.png' )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "bsv_test02.png".\n' );

  return
end
