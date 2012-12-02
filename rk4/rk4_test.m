function [ t, u ] = rk4_test ( )

%*****************************************************************************80
%
%% RK4_PRB demonstrates the use of the RK4 one-step ODE solver.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real T(*), the time values.
%
%    Output, real U(*), the computed solution values.
%
%  Local Parameters:
%
%    Local, real DT, the time step.
%
%    Local, real T0, the time at which the solution is known.
%
%    Local, real TMAX, the maximum time at which a solution is desired.
%
%    Local, real U0, the estimated solution at time T0.
%
  dt = 0.1;
  t0 = 0.0;
  tmax = 12.0 * pi;
  u0 = 0.5;

  t_num = floor ( 1 + ( tmax - t0 ) / dt );

  t = zeros ( t_num, 1 );
  u = zeros ( t_num, 1 );

  i = 1;
  t(i) = t0;
  u(i) = u0;

  while ( 1 )
%
%  Print (T0,U0).
%
    fprintf ( 1, '  %g  %g\n', t0, u0 );
%
%  Stop if we've exceeded TMAX.
%
    if ( tmax <= t0 )
      break
    end
%
%  Otherwise, advance to time T1, and have RK4 estimate 
%  the solution U1 there.
%
    t1 = t0 + dt;
    u1 = rk4 ( t0, u0, dt, @f3 );

    i = i + 1;
    t(i) = t1;
    u(i) = u1;
%
%  Shift the data to prepare for another step.
%
    t0 = t1;
    u0 = u1;

  end

  return
end
