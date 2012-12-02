function btv_test08 ( )

%*****************************************************************************80
%
%% BTV_TEST08 tests BURGERS_TIME_VISCOUS with the spline initial condition.
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
  fprintf ( 1, 'BTV_TEST08\n' );
  fprintf ( 1, '  Test BURGERS_TIME_VISCOUS with the spline initial condition.\n' );
  fprintf ( 1, '  Use periodic boundaries.\n' );
  fprintf ( 1, '  Plot the solution profile at the final time.\n' );

  nx = 81;
  nt = 200;
  t_max = 2.0;
  nu = 0.01;
  bc = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial condition: spline\n' );
  fprintf ( 1, '  Number of space nodes = %d\n', nx );
  fprintf ( 1, '  Number of time steps = %d\n', nt );
  fprintf ( 1, '  Final time T_MAX = %g\n', t_max );
  fprintf ( 1, '  Viscosity = %g\n', nu );
  fprintf ( 1, '  Boundary condition = %d\n', bc );

  U = burgers_time_viscous ( @ic_spline, nx, nt, t_max, nu, bc );
%
%  I needed a plot of U at the midpoint at the final time.
%
  figure ( 8 )

  clf
  hold on
  x = linspace ( -1.0, +1.0, nx );
  plot ( x, U(nt+1,:), 'r-', 'Linewidth', 3 )
  plot ( 0.0, U(nt+1,floor(nx+1)/2), 'k.', 'Markersize', 50 )
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- U(X,T=T_max) --->' )
  title ( 'Solution profile at final time' )
  hold off

  filename = 'btv_test08.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot as "%s"\n', filename );

  return
end
