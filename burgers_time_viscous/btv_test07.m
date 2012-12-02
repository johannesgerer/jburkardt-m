function btv_test07 ( )

%*****************************************************************************80
%
%% BTV_TEST07 tests BURGERS_TIME_VISCOUS with the gaussian initial condition.
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
  fprintf ( 1, 'BTV_TEST07\n' );
  fprintf ( 1, '  Test BURGERS_TIME_VISCOUS with the gaussian initial condition.\n' );
  fprintf ( 1, '  Plot the solutions U(X,T) as a surface.\n' );

  nx = 81;
  nt = 200;
  t_max = 2.0;
  nu = 0.01;
  bc = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial condition: gaussian\n' );
  fprintf ( 1, '  Number of space nodes = %d\n', nx );
  fprintf ( 1, '  Number of time steps = %d\n', nt );
  fprintf ( 1, '  Final time T_MAX = %g\n', t_max );
  fprintf ( 1, '  Viscosity = %g\n', nu );
  fprintf ( 1, '  Boundary condition = %d\n', bc );

  U = burgers_time_viscous ( @ic_gaussian, nx, nt, t_max, nu, bc );
%
%  Plot the solutions as a surface.
%
  figure ( 7 )

  x = linspace ( -1.0, +1.0, nx );
  t = linspace ( 0.0, t_max, nt + 1 );
  surf ( x, t, U )
  shading interp
  xlabel ( 'x' );
  ylabel ( 't' );
  zlabel ( 'u(x,t)' );
  title ( 'Burgers equation solutions over time, initial condition gaussian' )
  grid on
  colormap ( 'jet' );

  filename = 'btv_test07.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot as "%s"\n', filename );

  return
end
