function [ t, x, v ] = spring_ode ( )

%*****************************************************************************80
%
%% MAIN is the main program for SPRING_ODE2.
%
%  Discussion:
%
%    This is a revision of the SPRING_ODE code.
%
%    In this revision of the program, we want to use vectors (C arrays) to 
%    store the data, and we want to write the data out to a file in a form 
%    that Gnuplot (or other plotting programs) can use.
%
%    Hooke's law for a spring observes that the restoring force is
%    proportional to the displacement: F = - k x
%
%    Newton's law relates the force to acceleration: F = m a
%
%    Putting these together, we have
%
%      m * d^2 x/dt^2 = - k * x
%
%    We can add a damping force with coefficient c:
%
%      m * d^2 x/dt^2 = - k * x - c * dx/dt
%
%    If we write this as a pair of first order equations for (x,v), we have
%
%          dx/dt = v
%      m * dv/dt = - k * x - c * v
%
%    and now we can approximate these values for small time steps.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real T(*), X(*), V(*), the time, position and velocity 
%    of the mass for each timestep.
%
  timestamp ( );
  fprintf ( 1, '#\n' );
  fprintf ( 1, '#SPRING_ODE2\n' );
  fprintf ( 1, '#  MATLAB version\n' );
  fprintf ( 1, '#  Approximate the solution of a spring equation.\n' );
  fprintf ( 1, '#  Display the solution with line printer graphics.\n' );
  fprintf ( 1, '#\n' );
%
%  Data
%
  m = 1.0;
  k = 1.0;
  c = 0.3;
  t_final = 20.0;
  n = 100;
  dt = t_final / n;
%
%  Initial conditions.
%
  t(1) = 0.0;
  x(1) = 1.0;
  v(1) = 0.0;
%
%  Compute the approximate solution at equally spaced times.
%
  for i = 2 : n + 1

    t(i) = ( i - 1 ) * t_final / n;
    x(i) = x(i-1) + dt * v(i-1);
    v(i) = v(i-1) + ( dt / m ) * ( - k * x(i-1) - c * v(i-1) );

  end
%
%  Write the data to a file for plotting, possibly by gnuplot.
%  gnuplot expects T, X, and V to be columns of output.
%
  for i = 1 : n + 1
    fprintf ( 1, '%g  %g  %g\n', t(i), x(i), v(i) );
  end
%
%  Terminate.
%
  fprintf ( 1, '#\n' );
  fprintf ( 1, '#SPRING_ODE2:\n' );
  fprintf ( 1, '#  Normal end of execution.\n' );
  fprintf ( 1, '#\n' );
  timestamp ( );

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
  fprintf ( 1, '# %s\n', s );

  return
end
