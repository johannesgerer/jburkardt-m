function fd_predator_prey ( p0, tspan, step_num )

%*****************************************************************************80
%
%% FD_PREDATOR_PREY solves a pair of predator-prey ODE's.
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
%      PREY(0) = 5000
%      PRED(0) =  100
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
%    In this program, the pair of ODE's is solved with a simple finite difference
%    approximation using a fixed step size.  In general, this is NOT an efficient
%    or reliable way of solving differential equations.  However, this program is
%    intended to illustrate the ideas of finite difference approximation.
%
%    In particular, if we choose a fixed time step size DT, then a derivative
%    such as dPREY/dT is approximated by:
%
%      d PREY / dT = approximately ( PREY(T+DT) - PREY(T) ) / DT
%
%    which means that the first differential equation can be written as
%
%      PREY(T+DT) = PREY(T) + DT * ( 2 * PREY(T) - 0.001 * PREY(T) * PRED(T) ).
%
%    We can rewrite the equation for PRED as well.  Then, since we know the
%    values of PRED and PREY at time 0, we can use these finite difference
%    equations to estimate the values of PRED and PREY at time DT.  These values
%    can be used to get estimates at time 2*DT, and so on.  To get from time
%    T_START = 0 to time T_STOP = 5, we simply take STEP_NUM steps each of size
%    DT = ( T_STOP - T_START ) / STEP_NUM.
%
%    Because finite differences are only an approximation to derivatives, this
%    process only produces estimates of the solution.  And these estimates tend
%    to become more inaccurate for large values of time.  Usually, we can reduce
%    this error by decreasing DT and taking more, smaller time steps.
%
%    In this example, for instance, taking just 100 steps gives nonsensical
%    answers.  Using STEP_NUM = 1000 gives an approximate solution that seems
%    to have the right kind of oscillatory behavior, except that the amplitude
%    of the waves increases with each repetition.  Using 10000 steps, the
%    approximation begins to become accurate enough that we can see that the
%    waves seem to have a fixed period and amplitude.
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
%    Input, real P0(2), the initial number of prey and predators.
%
%    Input, real TSPAN(2), the initial and final times.
%
%    Input, integer STEP_NUM, the number of steps.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD_PREDATOR_PREY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A finite difference approximate solution of a pair\n' );
  fprintf ( 1, '  of ordinary differential equations for a population\n' );
  fprintf ( 1, '  of predators and prey.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The exact solution shows wave behavior, with a fixed\n' );
  fprintf ( 1, '  period and amplitude.  The finite difference approximation\n' );
  fprintf ( 1, '  can provide a good estimate for this behavior if the stepsize\n' );
  fprintf ( 1, '  DT is small enough.\n' );

  t_start = tspan(1);
  t_stop =  tspan(2);
  dt = ( t_stop - t_start ) / step_num;

  trf = zeros (3,step_num+1);

  trf(1,1) = t_start;
  trf(2,1) = p0(1);
  trf(3,1) = p0(2);

  for i = 1 : step_num
    trf(1,i+1) = trf(1,i) + dt;
    trf(2,i+1) = trf(2,i) + dt * (    2 * trf(2,i) - 0.004 * trf(2,i) * trf(3,i) );
    trf(3,i+1) = trf(3,i) + dt * ( - 10 * trf(3,i) + 0.003 * trf(2,i) * trf(3,i) );
  end
%
%  Time plots.
%
  figure ( 1 )
  plot ( trf(1,:), trf(2,:), 'g-', ...
         trf(1,:), trf(3,:), 'r-', 'LineWidth', 3 )
  filename = sprintf ( 'trf_%d_time.png', step_num );
  title ( 'Predator Prey System Solved by Finite Differences' );
  grid on
  xlabel ( 'Time' );
  ylabel ( 'Populations' );
  print ( '-dpng', filename );
%
%  Phase plot.
%
  figure ( 2 )
  plot ( trf(2,:), trf(3,:), 'b-', 'LineWidth', 3 )
  filename = sprintf ( 'trf_%d_phase.png', step_num );
  title ( 'Predator Prey System Solved by Finite Differences' );
  grid on
  xlabel ( 'Rabbits' );
  ylabel ( 'Foxes' );
  print ( '-dpng', filename );
%
%  Write data to files.
%
  filename = sprintf ( 'trf_%d.txt', step_num );
  r8mat_write ( filename, 3, step_num + 1, trf );
  fprintf ( 1, '  T, R, F values written to "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD_PREDATOR_PREY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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
