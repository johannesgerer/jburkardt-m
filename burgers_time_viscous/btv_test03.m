function btv_test03 ( )

%*****************************************************************************80
%
%% BTV_TEST03 tests BURGERS_TIME_VISCOUS with the gaussian initial condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTV_TEST03\n' );
  fprintf ( 1, '  Test BURGERS_TIME_VISCOUS with the gaussian initial condition.\n' );
  fprintf ( 1, '  Use a Neumann condition on the right.\n' );

  nx = 81;
  nt = 200;
  t_max = 2.0;
  nu = 0.01;
  bc = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial condition: gaussian\n' );
  fprintf ( 1, '  Number of space nodes = %d\n', nx );
  fprintf ( 1, '  Number of time steps = %d\n', nt );
  fprintf ( 1, '  Final time T_MAX = %g\n', t_max );
  fprintf ( 1, '  Viscosity = %g\n', nu );
  fprintf ( 1, '  Boundary condition = %d\n', bc );

  U = burgers_time_viscous ( @ic_gaussian, nx, nt, t_max, nu, bc );

  x = linspace ( -1.0, +1.0, nx );

  figure ( 3 )

  plot ( x, U(1:50:(nt+1),:), 'Linewidth', 3 )
  grid on
  xlabel ( '<-- X -->' )
  ylabel ( '<-- U(X,T) -->' )
  title ( 'Burgers equation solutions over time, initial condition gaussian' )

  filename = 'btv_test03.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot as "%s"\n', filename );

  return
end
