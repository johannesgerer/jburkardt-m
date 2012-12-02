function correlation_test01 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST01 plots the correlation functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST01\n' );
  fprintf ( 1, '  Make plots of correlation functions.\n' );
%
%  besselj
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 8.0, 8.0, n );
  c = correlation_besselj ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 8.0, 8.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel J correlation function' )
  hold off
  filename = 'besselj_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  besselk
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 4.0, 4.0, n );
  c = correlation_besselk ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 4.0, 4.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel K correlation function' )
  hold off
  filename = 'besselk_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  circular
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_circular ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Circular correlation function' )
  hold off
  print -dpng 'correlation_circular_plot.png'
  fprintf ( 1, '  Created "correlation_circular_plot.png".\n' );
%
%  constant
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_constant ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 4 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Constant correlation function' )
  hold off
  filename = 'constant_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  cubic
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_cubic ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Cubic correlation function' )
  hold off
  filename = 'cubic_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped cosine
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 6.0, 6.0, n );
  c = correlation_damped_cosine ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 6.0, 6.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Damped cosine correlation function' )
  hold off
  filename = 'damped_cosine_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped sine
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 12.0, 12.0, n );
  c = correlation_damped_sine ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 12.0, 12.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Damped sine correlation function' )
  hold off
  filename = 'damped_sine_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  exponential
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_exponential ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Exponential correlation function' )
  hold off
  filename = 'exponential_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  gaussian
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_gaussian ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Gaussian correlation function' )
  hold off
  filename = 'gaussian_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  hole
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_hole ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Hole correlation function' )
  hold off
  filename = 'hole_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  linear
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_linear ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Linear correlation function' )
  hold off
  filename = 'linear_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  matern, nu = 2.5
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  nu = 2.5;
  c = correlation_matern ( n, rho, rho0, nu );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Matern correlation function (NU=2.5)' )
  hold off
  filename = 'matern_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  pentaspherical
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_pentaspherical ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Pentaspherical correlation function' )
  hold off
  filename = 'pentaspherical_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  power, e = 2.0
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  e = 2.0;
  c = correlation_power ( n, rho, rho0, e );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Power correlation function (E=2.0)' )
  hold off
  filename = 'power_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  rational quadratic
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 4.0, 4.0, n );
  c = correlation_rational_quadratic ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 4.0, 4.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Rational quadratic correlation function' )
  hold off
  filename = 'rational_quadratic_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  spherical
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_spherical ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Spherical correlation function' )
  hold off
  filename = 'spherical_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  white noise
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( - 2.0, 2.0, n );
  c = correlation_white_noise ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 3 );
  plot ( [ - 2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'White noise correlation function' )
  hold off
  filename = 'white_noise_plot.png';
  print -dpng 'correlation_white_noise_plot.png'
  fprintf ( 1, '  Created "correlation_white_noise_plot.png".\n' );

  close

  return
end

