function predator_prey_continuous ( p0, tspan )

%*****************************************************************************80
%
%% PREDATOR_PREY_CONTINUOUS solves a predator-prey system of ODE's.
%
%  Discussion:
%
%    The physical system under consideration is a pair of animal populations.
%
%    The PREY reproduce rapidly; for each animal alive at the beginning of the
%    year, two more will be born by the end of the year.  The prey do not have
%    a natural death rate; instead, they only die by being eaten by the predator.
%    Every prey animal has 1 chance in 1000 of being eaten in a given year by
%    a given predator.
%
%    The PREDATORS only die of starvation, but this happens very quickly.
%    If unfed, a predator will tend to starve in about 1/10 of a year.
%    On the other hand, the predator reproduction rate is dependent on
%    eating prey, and the chances of this depend on the number of available prey.
%
%    The resulting differential equations can be written:
%
%      PRED(0) = 5000         
%      PREY(0) =  100
%
%      d PREY / dT =    2 * PREY(T) - 0.001 * PREY(T) * PRED(T)
%      d PRED / dT = - 10 * PRED(T) + 0.002 * PREY(T) * PRED(T)
%
%    Here, the initial values (5000,100) are a somewhat arbitrary starting point.
%
%    The pair of ordinary differential equations that result have an interesting
%    behavior.  For certain choices of the interaction coefficients (such as
%    those given here), the populations of predator and prey will tend to 
%    a periodic oscillation.  The two populations will be out of phase; the number
%    of prey will rise, then after a delay, the predators will rise as the prey
%    begins to fall, causing the predator population to crash again.
%
%    In this program, the pair of ODE's is solved by calling MATLAB's ODE23 solver.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Second Edition,
%    Prentice Hall, 1999,
%    ISBN: 0-13-012641-1,
%    LC: QA297.P45.
%
%  Parameters:
%
%    Input, real P0 = [ PREY, PRED ], the initial number of prey and predators.
%    A reasonable value might be [ 5000, 100 ].
%
%    Input, real TSPAN = [ T0, TMAX ], the initial and final times.
%    A reasonable value might be [ 0, 5 ].
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PREDATOR_PREY_CONTINUOUS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A pair of ordinary differential equations for a population\n' );
  fprintf ( 1, '  of predators and prey are solved by MATLAB''s ODE23.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The exact solution shows periodic behavior, with a fixed\n' );
  fprintf ( 1, '  period and amplitude.\n' );

  [ tout, pout ] = ode23 ( @pp_ode, tspan, p0 );
%
%  Plot the solution.
%
  plot ( tout, pout(:,1), 'g', ...
         tout, pout(:,2), 'r', ...
         'LineWidth', 2 );

  xlabel ( 'Time' );
  ylabel ( 'Population' );
  title ( 'Predator Prey System Solved by ODE23' )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD_PREDATOR_PREY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dydt = pp_ode ( t, y )

%*****************************************************************************80
%
%% PP_ODE evaluates the righthand side of the system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Second Edition,
%    Prentice Hall, 1999,
%    ISBN: 0-13-012641-1,
%    LC: QA297.P45.
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real Y(2), the current solution variables.
%
%    Output, real DYDT(2), the right hand side of the 2 ODE's.
%
  dydt(1,1) =    2.0 * y(1) - 0.001 * y(1) * y(2);
  dydt(2,1) = - 10.0 * y(2) + 0.002 * y(1) * y(2);

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
