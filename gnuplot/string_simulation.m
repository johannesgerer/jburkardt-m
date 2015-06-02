function string_simulation ( )

%*****************************************************************************80
%
%% MAIN is the main program for STRING_SIMULATION.
%
%  Discussion:
%
%    This program solves the 1D wave equation of the form:
%
%      Utt = c^2 Uxx
%
%    over the spatial interval (X1,X2) and time interval (T1,T2),
%    with initial conditions:
%
%      U(T1,X)  = U_T1(X),
%      Ut(T1,X) = UT_T1(X),
%
%    and boundary conditions of Dirichlet type:
%
%      U(T,X1) = U_X1(T),
%      U(T,X2) = U_X2(T).
%
%    The value C represents the propagation speed of waves.
%
%    The program uses the finite difference method, and marches
%    forward in time, solving for all the values of U at the next
%    time step by using the values known at the previous two time steps.
%
%    Central differences may be used to approximate both the time
%    and space derivatives in the original differential equation.
%
%    Thus, assuming we have available the approximated values of U
%    at the current and previous times, we may write a discretized
%    version of the wave equation as follows:
%
%      Uxx(T,X) = ( U(T,   X+dX) - 2 U(T,X) + U(T,   X-dX) ) / dX^2
%      Utt(T,X) = ( U(T+dt,X   ) - 2 U(T,X) + U(T-dt,X   ) ) / dT^2
%
%    If we multiply the first term by C^2 and solve for the single
%    unknown value U(T+dt,X), we have:
%
%      U(T+dT,X) =        (     C^2 * dT^2 / dX^2 ) * U(T,   X+dX)
%                  +  2 * ( 1 - C^2 * dT^2 / dX^2 ) * U(T,   X   )
%                  +      (     C^2 * dT^2 / dX^2 ) * U(T,   X-dX)
%                  -                                  U(T-dT,X   )
%
%    (Equation to advance from time T to time T+dT, except for FIRST step)
%
%    However, on the very first step, we only have the values of U
%    for the initial time, but not for the previous time step.
%    In that case, we use the initial condition information for dUdT
%    which can be approximated by a central difference that involves
%    U(T+dT,X) and U(T-dT,X):
%
%      dU/dT(T,X) = ( U(T+dT,X) - U(T-dT,X) ) / ( 2 * dT )
%
%    and so we can estimate U(T-dT,X) as
%
%      U(T-dT,X) = U(T+dT,X) - 2 * dT * dU/dT(T,X)
%
%    If we replace the "missing" value of U(T-dT,X) by the known values
%    on the right hand side, we now have U(T+dT,X) on both sides of the
%    equation, so we have to rearrange to get the formula we use
%    for just the first time step:
%
%      U(T+dT,X) =   1/2 * (     C^2 * dT^2 / dX^2 ) * U(T,   X+dX)
%                  +       ( 1 - C^2 * dT^2 / dX^2 ) * U(T,   X   )
%                  + 1/2 * (     C^2 * dT^2 / dX^2 ) * U(T,   X-dX)
%                  +  dT *                         dU/dT(T,   X   )
%
%    (Equation to advance from time T to time T+dT for FIRST step.)
%
%    It should be clear now that the quantity ALPHA = C * DT / DX will affect
%    the stability of the calculation.  If it is greater than 1, then
%    the middle coefficient 1-C^2 DT^2 / DX^2 is negative, and the
%    sum of the magnitudes of the three coefficients becomes unbounded.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Local Parameters:
%
%    Local, real ALPHA, the CFL stability parameter.
%
%    Local, real C, the wave speed.
%
%    Local, real DT, the time step.
%
%    Local, real DX, the spatial step.
%
%    Local, integer M, the number of time steps.
%
%    Local, integer N, the number of spatial intervals.
%
%    Local, real T1, T2, the initial and final times.
%
%    Local, real U(M+1,N+1), the computed solution.
%
%    Local, real X1, X2, the left and right spatial endpoints.
%
  m = 30;
  n = 40;
  c = 0.25;
  t1 = 0.0;
  t2 = 3.0;
  x1 = 0.0;
  x2 = 1.0;

  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STRING_SIMULATION:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Simulate the behavior of a vibrating string.\n' );

  dx = ( x2 - x1 ) / n;
  dt = ( t2 - t1 ) / m;
  alpha = ( c * dt / dx ) ^ 2;
  fprintf ( 1, '  ALPHA = ( C * dT / dX )^2 = %g\n', alpha );
%
%  Warn the user if ALPHA will cause an unstable computation.
%
  if ( 1.0 < alpha )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Warning!\n' );
    fprintf ( 1, '  ALPHA is greater than 1.\n' );
    fprintf ( 1, '  The computation is unstable.\n' );
  end
%
%  Time step 0: 
%  Use the initial condition for U.
%
  u = zeros ( m + 1, n + 1 );

  u(1,1) = 0.0;
  for i = 2 : n
    x = ( i - 1 ) * dx;
    u(1,i) = f ( x );
  end
  u(1,n+1) = 0.0;
%
%  Time step 1:
%  Use the initial condition for dUdT.
%
  u(2,1) = 0.0;
  for i = 2 : n
    x = ( i - 1 ) * dx;
    u(2,i) = ...
        ( alpha / 2.0 ) * u(1,i-1) ...
      + ( 1.0 - alpha ) * u(1,i)   ...
      + ( alpha / 2.0 ) * u(1,i+1) ...
      + dt * g ( x );
  end
  u(2,n+1) = 0.0;
%
%  Time steps 2 through M:
%
  for j = 3 : m + 1
    u(j,1) = 0.0;
    for i = 2 : n
      u(j,i) = ...
                        alpha   * u(j-1,i-1) ...
        + 2.0 * ( 1.0 - alpha ) * u(j-1,i)   ...
        +               alpha   * u(j-1,i+1) ...
        -                         u(j-2,i);
    end
    u(j,n+1) = 0.0;
  end
%
%  Write data file.
%
  data_filename = 'string_data.txt';
  data_unit = fopen ( data_filename, 'wt' );

  for i = 1 : m + 1;
    t = ( i - 1 ) * dt;
    for j = 1 : n + 1
      x = ( j - 1 ) * dx;
      fprintf ( data_unit, '%10.4f  %10.4f  %10.4f\n', x, t, u(i,j) );
    end
    fprintf ( data_unit, '\n' );
  end
  fclose ( data_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot data written to the file "%s".\n', data_filename );
%
%  Write gnuplot command file.
%
  command_filename = 'string_commands.txt';
  command_unit = fopen ( command_filename, 'wt' );

  fprintf ( command_unit, 'set term png\n' );
  fprintf ( command_unit, 'set output "string.png"\n' );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'unset key\n' );
  fprintf ( command_unit, 'set xlabel "<---X--->"\n' );
  fprintf ( command_unit, 'set ylabel "<---Time--->"\n' );
  fprintf ( command_unit, 'splot "%s" using 1:2:3 with lines\n', data_filename );
  fprintf ( command_unit, 'quit\n' );

  fclose ( command_unit );

  fprintf ( 1, '  Gnuplot command data written to the file "%s".\n', command_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STRING_SIMULATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = f ( x )

%*****************************************************************************80
%
%% F supplies the initial condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the location.
%
%    Output, real VALUE, the value of the solution at time 0 and location X.
%
  if ( 0.25 <= x && x <= 0.50 )
    value = ( x - 0.25 ) * ( 0.50 - x );
  else
    value = 0.0;
  end

  return
end
function value = g ( x )

%*****************************************************************************80
%
%% G supplies the initial derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the location.
%
%    Output, real VALUE, the value of the time derivative of the solution 
%    at time 0 and location X.
%
  value = 0.0;

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

