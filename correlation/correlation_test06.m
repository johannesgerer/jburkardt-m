function correlation_test06 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST06 plots sample paths with SAMPLE_PATHS2_CHOLESKY/EIGEN/FFT.
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
  fprintf ( 1, 'CORRELATION_TEST06\n' );
  fprintf ( 1, '  For non-stationary correlation functions:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_PATHS2_CHOLESKY generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the Cholesky factor.\n' );
  fprintf ( 1, '  It requires that the correlation matrix is nonnegative definite.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_PATHS2_EIGEN generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the eigen factorization.\n' );
  fprintf ( 1, '  If the correlation matrix is not nonnegative definite,\n' );
  fprintf ( 1, '  we simply suppress negative eigenvalues.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_PATHS2_FFT generates sample paths from the\n' );
  fprintf ( 1, '  correlation matrix, factored using the FFT factorization\n' );
  fprintf ( 1, '  of the correlation matrix after embedding in a circulant.\n' );
  fprintf ( 1, '\n' );
%
%  brownian
%
  n = 1001;
  n2 = 3;
  rhomin = 0.0;
  rhomax = 10.0;
  rho0 = 1.0;
  x = sample_paths2_cholesky ( n, n2, rhomin, rhomax, rho0, @correlation_brownian );

  rho = linspace ( rhomin, rhomax, n );

  clf
  hold on
  plot ( rho, x(:,1), 'Linewidth', 2, 'Color', 'r' );
  plot ( rho, x(:,2), 'Linewidth', 2, 'Color', 'g' );
  plot ( rho, x(:,3), 'Linewidth', 2, 'Color', 'b' );
  plot ( [ rhomin, rhomax], [0.0, 0.0], 'Linewidth', 2, 'Color', 'k' );
  grid on
  xlabel ( '<-- Distance -->' )
  title ( 'Brownian sample paths' )
  hold off
  print -dpng 'correlation_brownian_paths.png'
  fprintf ( 1, '  Created "correlation_brownian_paths.png".\n' );

  return
end

