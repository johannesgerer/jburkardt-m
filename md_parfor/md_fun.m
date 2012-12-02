function [ pe, ke, e_lost ] = md_fun ( nd, np, step_num, dt )

%*****************************************************************************80
%
%% MD_FUN is the main program for the molecular dynamics simulation.
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
%    15 June 2012
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt, Gene Cliff.
%
%  Parameters:
%
%    Input, integer ND, the spatial dimension.  
%    A value of 2 or 3 is usual.
%    The default value is 3.
%
%    Input, integer NP, the number of particles.  
%    A value of 1000 or 2000 is small but "reasonable".
%    The default value is 1000.
%
%    Input, integer STEP_NUM, the number of time steps.  
%    A value of 500 is a small but reasonable value.
%    The default value is 100.
%
%    Input, real DT, the time step.
%    A value of 0.1 is large; the system will begin to move quickly but the
%    results will be less accurate.
%    A value of 0.0001 is small, but the results will be more accurate.
%    The default value is 0.1.
%
%    Output, real PE, the potential energy at the final time step.
%
%    Output, real KE, the kinetic energy at the final time step.
%
%    Output, real E_LOST, the relative error in the total energy.
%
  if ( nargin < 1 )
    nd = 3;
  end

  if ( nargin < 2 )
    np = 1000;
  end

  if ( nargin < 3 )
    step_num = 100;
  end

  if ( nargin < 4 )
    dt = 0.1;
  end

  mass = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_FUN\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A molecular dynamics program.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ND, the spatial dimension, is %d\n', nd );
  fprintf ( 1, '  NP, the number of particles is %d.\n', np );
  fprintf ( 1, '  STEP_NUM, the number of time steps, is %d.\n', step_num );
  fprintf ( 1, '  DT, the time step size, is %f seconds.\n', dt );
%
%  Set the dimensions of the box.
%
  box(1:nd) = 10.0;
%
%  Initialize the random number generator to a prescribed state.
%  RNG is the new recommended interface to the MATLAB random number generator.
%
  seed = 123456789;
  rng ( seed );
%
%  Set initial positions, velocities, and accelerations.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initializing positions, velocities, and accelerations.\n' );

  [ pos, vel, acc ] = initialize ( np, nd, box );
%
%  Compute the forces and energies.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computing initial forces and energies.\n' );

  [ force, pe, ke ] = compute ( np, nd, pos, vel, mass );
%
%  Save the initial total energy for use in the accuracy check.
%
  e0 = pe + ke;
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
  e_lost = ( pe + ke - e0 ) / e0;
  fprintf ( 1, '  %8d  %14f  %14f  %14e\n', step, pe, ke, e_lost );
  step_print_index = step_print_index + 1;
  step_print = floor ( ( step_print_index / step_print_num ) * step_num );

  for step = 1 : step_num

    [ force, pe, ke ] = compute ( np, nd, pos, vel, mass );

    if ( step == step_print )
      e_lost = ( pe + ke - e0 ) / e0 ;
      fprintf ( 1, '  %8d  %14f  %14f  %14e\n', step, pe, ke, e_lost );
      step_print_index = step_print_index + 1;
      step_print = floor ( ( step_print_index / step_print_num ) * step_num );
    end

    [ pos, vel, acc ] = update ( np, nd, pos, vel, force, acc, mass, dt );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_FUN\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function [ f, pot, kin ] = compute ( np, nd, pos, vel, mass )

%*****************************************************************************80
%
%% COMPUTE computes the forces and energies.
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
%    Thanks to Abouzar Moshfegh for suggesting an improvement in the
%    kinetic energy computation, 05 July 2012.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2012
%
%  Author:
%
%    Original FORTRAN90 version by Bill Magro.
%    MATLAB version by John Burkardt, Gene Cliff.
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

  parfor i = 1 : np

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
% kin = 0.5 * mass * sum ( diag ( vel' * vel ) );
  kin = 0.5 * mass * sum ( sum ( vel.^2 ) );

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
%    MATLAB version by John Burkardt, Gene Cliff.
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
  acc(1:nd,1:np) = 0.0;

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
%    MATLAB version by John Burkardt, Gene Cliff.
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
