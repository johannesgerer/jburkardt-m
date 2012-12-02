function correlation_test02 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST02 plots sample paths with SAMPLE_PATHS_CHOLESKY/EIGEN/FFT.
%
%  Discussion:
%
%    Most paths will be blue, but make the LAST one red so that there will
%    always be one distinguished path that is easy to follow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST02\n' );
  fprintf ( 1, '  SAMPLE_PATHS_CHOLESKY generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the Cholesky factor.\n' );
  fprintf ( 1, '  It requires that the correlation matrix is nonnegative definite.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_PATHS_EIGEN generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the eigen factorization.\n' );
  fprintf ( 1, '  If the correlation matrix is not nonnegative definite,\n' );
  fprintf ( 1, '  we simply suppress negative eigenvalues.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_PATHS_FFT generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the FFT factorization\n' );
  fprintf ( 1, '  of the correlation matrix after embedding in a circulant.\n' );
  fprintf ( 1, '\n' );
%
%  besselj
%  nonpositive eigenvalues observed.
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_eigen ( n, n2, rhomax, 1.0, @correlation_besselj );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel J sample paths' )
  hold off
  filename = 'besselj_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  besselk
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_besselk );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel K sample paths' )
  hold off
  filename = 'besselk_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  circular
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_circular );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Circular sample paths' )
  hold off
  filename = 'circular_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  constant
%  nonpositive eigenvalues observed
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_eigen ( n, n2, rhomax, 1.0, @correlation_constant );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Constant sample paths' )
  hold off
  filename = 'constant_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  cubic
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_cubic );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Cubic sample paths' )
  hold off
  filename = 'cubic_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped cosine
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_damped_cosine );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Damped cosine sample paths' )
  hold off
  filename = 'damped_cosine_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped sine
%  nonpositive eigenvalues observed
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_eigen ( n, n2, rhomax, 1.0, @correlation_damped_sine );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Damped sine sample paths' )
  hold off
  filename = 'damped_sine_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  exponential
%  Let's try the FFT approach instead of Cholesky.
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_fft ( n, n2, rhomax, 1.0, @correlation_exponential );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Exponential sample paths' )
  hold off
  filename = 'exponential_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  gaussian
%  nonpositive eigenvalues observed
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_eigen ( n, n2, rhomax, 1.0, @correlation_gaussian );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Gaussian sample paths' )
  hold off
  filename = 'gaussian_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  hole
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_hole );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Hole sample paths' )
  hold off
  filename = 'hole_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  linear
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_linear );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Linear sample paths' )
  hold off
  filename = 'linear_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  matern ( nu = 2.5 )
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  nu = 2.5;
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_matern );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Matern (NU=2.5) sample paths' )
  hold off
  filename = 'matern_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  pentaspherical
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_pentaspherical );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Pentaspherical sample paths' )
  hold off
  filename = 'pentaspherical_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  power ( e = 2.0 )
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  nu = 2.5;
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_power );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Power (E=2.0) sample paths' )
  hold off
  filename = 'power_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  rational quadratic
%  nonpositive eigenvalues observed
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_eigen ( n, n2, rhomax, 1.0, @correlation_rational_quadratic );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Rational quadratic sample paths' )
  hold off
  filename = 'rational_quadratic_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  spherical
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_spherical );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Spherical sample paths' )
  hold off
  filename = 'spherical_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  white noise
%
  clf
  hold on
  n = 1001;
  n2 = 3;
  rhomax = 10.0;
  rho = linspace ( 0.0, rhomax, n );
  x = sample_paths_cholesky ( n, n2, rhomax, 1.0, @correlation_white_noise );
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ 0.0, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'White noise sample paths' )
  hold off
  filename = 'white_noise_paths.png';
  print ( '-dpng', filename )
  fprintf ( 1, '  Created "%s".\n', filename );

  close

  return
end



