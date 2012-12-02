function spring_ode ( )

%*****************************************************************************80
%
%% MAIN is the main program for SPRING_ODE.
%
%  Discussion:
%
%    This is a simple example of how to plot when you don't have a plotter.
%    This is a particular kind of "ASCII graphics", or "typewriter graphics"
%    or "lineprinter graphics", and shows you how valuable an illustration 
%    can be, even when it's as crude as this example.
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
%    Note that the plotting assumes that the value of X will always be
%    between -1 and +1.  If the initial condition uses V = 0, and X starts
%    between -1 and +1, then this will be OK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPRING_ODE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Approximate the solution of a spring equation.\n' );
  fprintf ( 1, '  Display the solution with line printer graphics.\n' );
  fprintf ( 1, '\n' );
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
  x = 1.0;
  v = 0.0;
%
%  Compute the approximate solution at equally spaced times.
%
  for i = 0 : n

    x_old = x;
    v_old = v;

    t = i * t_final / n;
    x = x_old + dt * v_old;
    v = v_old + ( dt / m ) * ( - k * x_old - c * v_old );
%
%  Approximate the position of X in [-1,+1] to within 1/10.
%
    p = floor ( ( (  1 * ( 1.0 - x ) ) + 21 * ( 1.0 + x ) ) / 2.0 );
    p = max ( p, 1 );
    p = min ( p, 21 );
%
%  Fill in the next line of the plot, placing 'x' in the p position.
%
    if ( mod ( i, 10 ) == 0 )
      z(1:21) = '-';
    else
      z(1:21) = ' ';
    end
    z(1) = '|';
    z(6) = '.';
    z(11) = '+';
    z(16) = '.';
    z(21) = '|';

    z(p) = 'x';
    for j = 1 : 21
      fprintf ( 1, '%c', z(j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPRING_ODE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
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
  fprintf ( 1, '%s\n', s );

  return
end
