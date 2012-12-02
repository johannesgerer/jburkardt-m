function md ( np, step_num )

%*****************************************************************************80
%
%% MD is the main program for the molecular dynamics simulation.
%
%  Discussion:
%
%    MD implements a simple molecular dynamics simulation.
%
%    The velocity Verlet time integration scheme is used.
%
%    The particles interact with a central pair potential.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer NP, the number of particles.  A value of 1000 or 2000
%    is small but "reasonable".
%
%    Input, integer STEP_NUM, the number of time steps.  A value of 500
%    is a small but reasonable value.
%
  if ( nargin < 1 )
    np = 1000;
  end

  if ( nargin < 2 )
    step_num = 500;
  end

  nd = 3;
  dt = 0.0001;
%
%  For less accuracy, but more action, try dt = 0.01;
%
  mass = 1.0;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A molecular dynamics program.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NP, the number of particles in the simulation is %d.\n', np );
  fprintf ( 1, '  STEP_NUM, the number of time steps, is %d.\n', step_num );
  fprintf ( 1, '  DT, the time step size, is %f seconds.\n', dt );
%
%  Set the dimensions of the box.
%
  box(1:nd) = 10.0;
%
%  Initialize the random number generator to a prescribed state.
%
  seed = 123456789;
  rand ( 'twister', seed );
%
%  Set initial positions, velocities, and accelerations.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initializing positions, velocities, and accelerations.\n' );

  [ pos, vel, acc ] = initialize ( np, nd, box, seed );
%
%  Compute the forces and energies.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computing initial forces and energies.\n' );

  [ force, potential, kinetic ] = compute_new ( np, nd, pos, vel, mass );
%
%  Save the initial total energy for use in the accuracy check.
%
  e0 = potential + kinetic;
%
%  This is the main time stepping loop:
%    Compute forces and energies,
%    Update positions, velocities, accelerations.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  At each step, we report the potential and kinetic energies.\n' );
  fprintf ( 1, '  The sum of these energies should be a constant.\n' );
  fprintf ( 1, '  As an accuracy check, we also print the relative error\n' );
  fprintf ( 1, '  in the total energy.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Step      Potential       Kinetic        (P+K-E0)/E0\n' );
  fprintf ( 1, '                Energy P        Energy K       Relative Energy Error\n' );
  fprintf ( 1, '\n' );

  step_print_index = 0;
  step_print_num = 10;
  
  step = 0;
  fprintf ( 1, '  %8d  %14f  %14f  %14e\n', ...
    step, potential, kinetic, ( potential + kinetic - e0 ) / e0 );
  step_print_index = step_print_index + 1;
  step_print = floor ( ( step_print_index * step_num ) / step_print_num );

  tic;

  for step = 1 : step_num

    [ force, potential, kinetic ] = compute_new ( np, nd, pos, vel, mass );

    if ( step == step_print ) 
      fprintf ( 1, '  %8d  %14f  %14f  %14e\n', ...
        step, potential, kinetic, ( potential + kinetic - e0 ) / e0 );
      step_print_index = step_print_index + 1;
      step_print = floor ( ( step_print_index * step_num ) / step_print_num );
%
%  If you take a larger time step, and more steps, it might be worth
%  plotting the successive positions of the particles.
%
      if ( 0 )
        clf
        scatter3 ( pos(1,:), pos(2,:), pos(3,:), 10.0, 'r', 'filled' )
        pause
      end

    end

    [ pos, vel, acc ] = update ( np, nd, pos, vel, force, acc, mass, dt );

  end

  wtime = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Main computation:\n' );
  fprintf ( 1, '    Wall clock time = %f seconds.\n', wtime );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ f, pot, kin ] = compute_new ( np, nd, pos, vel, mass )

%*****************************************************************************80
%
%% COMPUTE_NEW computes the forces and energies.
%
%  Discussion:
%
%    The computation of forces and energies is fully parallel.
%
%    The potential function V(X) is a harmonic well which smoothly
%    saturates to a maximum value at PI/2:
%
%      v(x) = ( sin ( min ( x, PI2 ) ) )^2
%
%    The derivative of the potential is:
%
%      dv(x) = 2.0 * sin ( min ( x, PI2 ) ) * cos ( min ( x, PI2 ) )
%            = sin ( 2.0 * min ( x, PI2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt and Gene Cliff.
%
%  Parameters:
%
%    Input, integer NP, the number of particles.
%
%    Input, integer ND, the number of spatial dimensions.
%
%    Input, real POS(ND,NP), the position of each particle.
%
%    Input, real VEL(ND,NP), the velocity of each particle.
%
%    Input, real MASS, the mass of each particle.
%
%    Output, real F(ND,NP), the forces.
%
%    Output, real POT, the total potential energy.
%
%    Output, real KIN, the total kinetic energy.
%
  f = zeros ( nd, np );
 
  pot = 0.0;
 
  pi2 = pi / 2.0;
 
  for i = 1 : np
     
    Ri = pos - repmat ( pos( :, i ), 1, np );    % array of vectors to 'i'
     
    D = sqrt ( sum ( Ri.^2 ) );                  % array of distances

    Ri = Ri( :, ( D > 0.0 ) ); 
     
    D = D( D > 0.0 );                            % save only pos values
     
    D2 = D .* ( D <= pi2 ) + pi2 * ( D > pi2 );  % truncate the potential.
     
    pot = pot + 0.5 * sum ( sin ( D2 ).^2 );     % accumulate pot. energy
     
    f( :, i) = Ri * ( sin ( 2*D2 ) ./ D )';      % force on particle 'i'

  end
%
%  Compute kinetic energy.
%
  kin = 0.5 * mass * sum ( diag ( vel' * vel ) );
     
  return
end
function [ f, pot, kin ] = compute_old ( np, nd, pos, vel, mass )

%*****************************************************************************80
%
%% COMPUTE_OLD computes the forces and energies.
%
%  Discussion:
%
%    The computation of forces and energies is fully parallel.
%
%    The potential function V(X) is a harmonic well which smoothly
%    saturates to a maximum value at PI/2:
%
%      v(x) = ( sin ( min ( x, PI2 ) ) )^2
%
%    The derivative of the potential is:
%
%      dv(x) = 2.0 * sin ( min ( x, PI2 ) ) * cos ( min ( x, PI2 ) )
%            = sin ( 2.0 * min ( x, PI2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2009
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt and Gene Cliff.
%
%  Parameters:
%
%    Input, integer NP, the number of particles.
%
%    Input, integer ND, the number of spatial dimensions.
%
%    Input, real POS(ND,NP), the position of each particle.
%
%    Input, real VEL(ND,NP), the velocity of each particle.
%
%    Input, real MASS, the mass of each particle.
%
%    Output, real F(ND,NP), the forces.
%
%    Output, real POT, the total potential energy.
%
%    Output, real KIN, the total kinetic energy.
%
  f = zeros ( nd, np );
 
  pot = 0.0;

  for i = 1 : np
%
%  Compute the potential energy and forces.
%
    for j = 1 : np

      if ( i ~= j )

        rij(1:nd) = pos(1:d,i) - pos(1:nd,j);

        d = sqrt ( sum ( rij(1:nd).^2 ) );
%
%  Truncate the distance.
%
        d2 = min ( d, pi / 2.0 );
%
%  Attribute half of the total potential energy to particle J.
%
        pot = pot + 0.5 * sin ( d2 ) * sin ( d2 );
%
%  Add particle J's contribution to the force on particle I.
%
        f(1:nd,i) = f(1:nd,i) - rij(1:nd) * sin ( 2.0 * d2 ) / d;

      end

    end

  end
%
%  Compute the total kinetic energy.
%
  kin = 0.5 * mass * sum ( vel(1:nd,1:np).^2 );
     
  return
end
function [ pos, vel, acc, seed ] = initialize ( np, nd, box, seed )

%*****************************************************************************80
%
%% INITIALIZE initializes the positions, velocities, and accelerations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2008
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer NP, the number of particles.
%
%    Input, integer ND, the number of spatial dimensions.
%
%    Input, real BOX(ND), specifies the maximum position
%    of particles in each dimension.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real POS(ND,NP), the position of each particle.
%
%    Output, real VEL(ND,NP), the velocity of each particle.
%
%    Output, real ACC(ND,NP), the acceleration of each particle.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Start by setting the positions to random numbers between 0 and 1.
%
  pos(1:nd,1:np) = rand ( nd, np );
%
%  Use these random values as scale factors to pick random locations
%  inside the box.
%
  for i = 1 : nd
    pos(i,1:np) = box(i) * pos(i,1:np);
  end
%
%  Velocities and accelerations begin at 0.
%
  vel(1:nd,1:np) = 0.0;
%
%  For a livelier initial condition, set vel(1:nd,1:np) = rand(nd,np);
%
  acc(1:nd,1:np) = 0.0;

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
function [ pos, vel, acc ] = update ( np, nd, pos, vel, f, acc, mass, dt )

%*****************************************************************************80
%
%% UPDATE updates positions, velocities and accelerations.
%
%  Discussion:
%
%    The time integration is fully parallel.
%
%    A velocity Verlet algorithm is used for the updating.
%
%    x(t+dt) = x(t) + v(t) * dt + 0.5 * a(t) * dt * dt
%    v(t+dt) = v(t) + 0.5 * ( a(t) + a(t+dt) ) * dt
%    a(t+dt) = f(t) / m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2008
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt
%
%  Parameters:
%
%    Input, integer NP, the number of particles.
%
%    Input, integer ND, the number of spatial dimensions.
%
%    Input, real POS(ND,NP), the position of each particle.
%
%    Input, real VEL(ND,NP), the velocity of each particle.
%
%    Input, real F(ND,NP), the force on each particle.
%
%    Input, real ACC(ND,NP), the acceleration of each
%    particle.
%
%    Input, real MASS, the mass of each particle.
%
%    Input, real DT, the time step.
%
%    Output, real POS(ND,NP), the updated position of each particle.
%
%    Output, real VEL(ND,NP), the updated velocity of each particle.
%
%    Output, real ACC(ND,NP), the updated acceleration of each
%    particle.
%
  rmass = 1.0 / mass;

  pos(1:nd,1:np) = pos(1:nd,1:np) + vel(1:nd,1:np) * dt ...
    + 0.5 * acc(1:nd,1:np) * dt * dt;

  vel(1:nd,1:np) = vel(1:nd,1:np) ...
    + 0.5 * dt * ( f(1:nd,1:np) * rmass + acc(1:nd,1:np) );

  acc(1:nd,1:np) = f(1:nd,1:np) * rmass;

  return
end
