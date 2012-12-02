function correlation_test03 ( )

%*****************************************************************************80
%
%% CORRELATION_TEST03 plots a correlation function for several values of RH00.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CORRELATION_TEST03\n' );
  fprintf ( 1, '  Make plots of correlation functions.\n' );
  fprintf ( 1, '\n' );
%
%  besselj
%
  clf
  hold on
  n = 101;
  rho0 = [ 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -8.0, 8.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_besselj ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -8.0, 8.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel J, RHO0 = 1, 1.5, 2, 4, 8' )
  axis ( [-8.0, 8.0, -1.0, +1.0] )
  hold off
  filename = 'besselj_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  besselk
%
  clf
  hold on
  n = 101;
  rho0 = [ 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -4.0, 4.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_besselk ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -4.0, 4.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Bessel K correlation function, RHO0 = 1, 1.5, 2, 4, 8' )
  axis ( [-4.0, 4.0, -1.0, +1.0] )
  hold off
  filename = 'besselk_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  circular
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_circular ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0 ], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Circular correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'circular_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  constant
%  Pointless to make multiple plots for this one.
%
  clf
  hold on
  n = 101;
  rho0 = 1.0;
  rho = linspace ( -2.0, 2.0, n );
  c = correlation_constant ( n, rho, rho0 );
  plot ( rho, c, 'Linewidth', 4 );
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Constant correlation function, RHO0 = 1' )
  axis ( [ -2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'constant_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  cubic
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_cubic ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Cubic correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'cubic_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped_cosine
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -6.0, 6.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_damped_cosine ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -6.0, 6.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Damped cosine correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -6.0, 6.0, -1.0, +1.0] )
  hold off
  filename = 'damped_cosine_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  damped_sine
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -12.0, 12.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_damped_sine ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -12.0, 12.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Damped sine correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -12.0, 12.0, -1.0, +1.0] )
  hold off
  filename = 'damped_sine_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  exponential
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.25, 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_exponential ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Exponential correlation function, RHO0 = 0.25, 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'exponential_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  gaussian
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.25, 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_gaussian ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Gaussian correlation function, RHO0 = 0.25, 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'gaussian_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  hole
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.25, 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_hole ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Hole correlation function, RHO0 = 0.25, 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'hole_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  linear
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_linear ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Linear correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'linear_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  matern, nu = 2.5
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  nu = 2.5;
  for i = 1 : length ( rho0 )
    c = correlation_matern ( n, rho, rho0(i), nu );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Matern correlation function (NU=2.5), RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'matern_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  pentaspherical
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_pentaspherical ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Pentaspherical correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'pentaspherical_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  power, e = 2.0
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  e = 2.0;
  for i = 1 : length ( rho0 )
    c = correlation_power ( n, rho, rho0(i), e );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'power correlation function (E=20), RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'power_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  rational quadratic
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -4.0, 4.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_rational_quadratic ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -4.0, 4.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Rational quadratic correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -4.0, 4.0, -1.0, +1.0] )
  hold off
  filename = 'rational_quadratic_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  spherical
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_spherical ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'Spherical correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [ -2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'spherical_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );
%
%  white_noise
%
  clf
  hold on
  n = 101;
  rho0 = [ 0.5, 1.0, 1.5, 2.0, 4.0, 8.0 ];
  rho = linspace ( -2.0, 2.0, n );
  for i = 1 : length ( rho0 )
    c = correlation_white_noise ( n, rho, rho0(i) );
    if ( rho0(i) == 1.0 )
      plot ( rho, c, 'Linewidth', 3, 'Color', 'r' );
    else
      plot ( rho, c, 'Linewidth', 3, 'Color', 'b' );
    end
  end
  plot ( [ -2.0, 2.0], [0.0, 0.0], 'Linewidth', 3, 'Color', 'k' );
  grid on
  ylabel ( '<-- Correlation Strength -->' )
  xlabel ( '<-- Distance -->' )
  title ( 'White noise correlation function, RHO0 = 0.5, 1, 1.5, 2, 4, 8' )
  axis ( [-2.0, 2.0, -1.0, +1.0] )
  hold off
  filename = 'white_noise_plots.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Created "%s".\n', filename );

  close

  return
end



