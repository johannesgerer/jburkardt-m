function lorenz_ode ( )

%*****************************************************************************80
%
%% MAIN is the main program for LORENZ_ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  m = 3;
  n = 200000;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LORENZ_ODE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Compute solutions of the Lorenz system.\n' );
  fprintf ( 1, '  Write data to a file for use by gnuplot.\n' );
%
%  Data
%
  t_final = 40.0;
  dt = t_final / n;
%
%  Initial conditions.
%
  t = linspace ( 0.0, t_final, n + 1 );

  x = zeros ( m, n + 1 );
  x(1:m,1) = [ 8.0; 1.0; 1.0 ];
%
%  Compute the approximate solution at equally spaced times.
%
  for j = 1 : n

    x(1:m,j+1) = rk4vec ( t(j), m, x(1:m,j), dt, @lorenz_rhs );

  end
%
%  Create the data file.
%  Only save a sample of the data!
%
  data_filename = 'lorenz_ode_data.txt';
  data_unit = fopen ( data_filename, 'wt' );
  for j = 1 : 50 : n + 1
    fprintf ( data_unit, '%g  %g  %g  %g\n', t(j), x(1:m,j) );
  end
  fclose ( data_unit );
  fprintf ( 1, '  Created data file "%s"\n', data_filename );
%
%  Create the command file.
%
  command_filename = 'lorenz_ode_commands.txt';
  command_unit = fopen ( command_filename, 'wt' );
  fprintf ( command_unit, '# %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, '# Usage:\n' );
  fprintf ( command_unit, '#  gnuplot < %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, 'set term png\n' );
  fprintf ( command_unit, 'set output "xyz_time.png"\n' );
  fprintf ( command_unit, 'set xlabel "<--- T --->"\n' );
  fprintf ( command_unit, 'set ylabel "<--- X(T), Y(T), Z(T) --->"\n' );
  fprintf ( command_unit, 'set title "X(T), Y(T), Z(T) versus Time"\n' );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'plot ' );
  fprintf ( command_unit, '"%s" using 1:2 lw 3 linecolor rgb "blue",\\\n', data_filename );
  fprintf ( command_unit, ' "" using 1:3 lw 3 linecolor rgb "red",\\\n' );
  fprintf ( command_unit, ' "" using 1:4 lw 3 linecolor rgb "green"\n' );
  fprintf ( command_unit, 'set output "xyz_3d.png"\n' );
  fprintf ( command_unit, 'set xlabel "<--- X(T) --->"\n' );
  fprintf ( command_unit, 'set ylabel "<--- Y(T) --->"\n' );
  fprintf ( command_unit, 'set zlabel "<--- Z(T) --->"\n' );
  fprintf ( command_unit, 'set title "(X(T),Y(T),Z(T)) trajectory"\n' );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'splot "%s" ', data_filename );
  fprintf ( command_unit, 'using 2:3:4 lw 1 linecolor rgb "blue"\n' );
  fclose ( command_unit );
  fprintf ( 1, '  Created command file "%s"\n', command_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LORENZ_ODE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dxdt = lorenz_rhs ( t, m, x )

%*****************************************************************************80
%
%% LORENZ_RHS evaluates the right hand side of the Lorenz ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the value of the independent variable.
%
%    Input, integer M, the spatial dimension.
%
%    Input, real X(M), the values of the dependent variables
%    at time T.
%
%    Output, real DXDT(M,1), the values of the derivatives
%    of the dependent variables at time T.
%
  beta = 8.0 / 3.0;
  rho = 28.0;
  sigma = 10.0;

  dxdt(1,1) = sigma * ( x(2) - x(1) );
  dxdt(2,1) = x(1) * ( rho - x(3) ) - x(2);
  dxdt(3,1) = x(1) * x(2) - beta * x(3);

  return
end
function u = rk4vec ( t0, m, u0, dt, f )

%*****************************************************************************80
%
%% RK4VEC takes one Runge-Kutta step for a vector ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T0, the current time.
%
%    Input, integer M, the spatial dimension.
%
%    Input, real U0(M), the solution estimate at the current time.
%
%    Input, real DT, the time step.
%
%    Input, function uprime = F ( t, m, u  ) 
%    which evaluates the derivative UPRIME(1:M) given the time T and
%    solution vector U(1:M).
%
%    Output, real U(M), the fourth-order Runge-Kutta solution 
%    estimate at time T0+DT.
%

%
%  Get four sample values of the derivative.
%
  f0 = f ( t0, m, u0 );

  t1 = t0 + dt / 2.0;
  u1(1:m) = u0(1:m) + dt * f0(1:m) / 2.0;
  f1 = f ( t1, m, u1 );

  t2 = t0 + dt / 2.0;
  u2(1:m) = u0(1:m) + dt * f1(1:m) / 2.0;
  f2 = f ( t2, m, u2 );

  t3 = t0 + dt;
  u3(1:m) = u0(1:m) + dt * f2(1:m);
  f3 = f ( t1, m, u1 );
%
%  Combine them to estimate the solution U at time T1.
%
  u(1:m) = u0(1:m) + dt * ( f0(1:m) + 2.0 * f1(1:m) + 2.0 * f2(1:m) ...
    + f3(1:m) ) / 6.0;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
