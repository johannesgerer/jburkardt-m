function bsv_test05 ( )

%*****************************************************************************80
%
%% BSV_TEST05 computes the zero crossing as a function of the left boundary value.
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
%  Reference
%
%    Toby Driscoll
%    Stochastic collocation for the Burgers equation.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BSV_TEST05:\n' );
  fprintf ( 1, '  For the Burgers equation on [A,B] with viscosity NU and \n' );
  fprintf ( 1, '  boundary conditions U(A)=ALPHA, U(B) = BETA,\n' );
  fprintf ( 1, '  with ALPHA and BETA of opposite sign,\n' );
  fprintf ( 1, '  let X0 be the point where the solution U changes sign.\n' );
  fprintf ( 1, '  Sample and plot the functional relationship X0(ALPHA).\n' );

  a = -1.0;
  b = +1.0;
  beta = -1.0;
  nu = 0.1;
  n = 81;
  output = 0;

  x = linspace ( a, b, n );
  
  m = 21;
  alpha_min = 0.95;
  alpha_max = 1.05;
  alpha_vec = linspace ( alpha_min, alpha_max, m );
%
%  Adjust the linear equally spaced nodes so that they are 
%  now quadratically arranged around the center point.
%
  alpha_ave = 0.5 * ( alpha_vec(1) + alpha_vec(m) );

  alpha_vec = alpha_ave + sign ( alpha_vec - alpha_ave ) .* ...
    ( ( alpha_vec - alpha_ave ) / ( alpha_max - alpha_ave ) ).^2 ...
    * ( alpha_max - alpha_ave );

% plot ( alpha_vec, 'r*-' )
% pause;
%
%  Compute X0 for the range of ALPHA's.
%
  x0_vec = zeros ( m, 1 );

  for i = 1 : m
    alpha = alpha_vec(i);
    u = bsv ( a, b, alpha, beta, nu, n, output );
    x0_vec(i) = bsv_crossing ( a, b, n, x, u );
  end
%
%  Display the results.
%  It's hard to choose which variable should be the independent one.
%
  figure ( 5 )
  clf
  hold on
  plot ( alpha_vec, x0_vec, 'b-', 'LineWidth', 3 );
% plot ( x0_vec, alpha_vec, 'b-', 'LineWidth', 3 );
  plot ( [ alpha_min; alpha_max ], [ 0.0; 0.0 ], 'r-', 'Linewidth', 3 );
% plot ( [ 0.0; 0.0], [ alpha_min; alpha_max ], 'r-', 'Linewidth', 3 );
  grid on
  title ( 'X0(\alpha), The zero-crossing as a function of left BC' );
  xlabel ( '<--- \alpha --->' )
  ylabel ( '<---X0 --->' )
  axis ( [alpha_min, alpha_max, -1.0, +1.0 ])
% axis ( [-1.0, +1.0, alpha_min, alpha_max ])
  hold off
  filename = 'bsv_test05.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot to file "%s".\n', filename );

  return
end
