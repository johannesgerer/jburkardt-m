function pic_serial ( )

%*****************************************************************************80
%
%% PIC_SERIAL applies the Particle in Cell method to an electrostatic problem.
%
%  Discussion:
%
%    Simple Electrostatic Particle In Cell (PIC) code in MATLAB
%    Flow of solar wind around a charged plate
%
%    For more, visit http://www.particleincell.com/2010/es-pic-method/
%    and http://www.particleincell.com/2011/particle-in-cell-example/
%
%  Modified:
%
%    27 July 2013
%
%  Parameters:
%
%    Local, real A(NX*NY,NX*NY), the finite difference stencil matrix.
%
%    Local, real ACC, the acceleration experienced by a particle.
%
%    Local, real AMU, the atomic mass unit.
%
%    Local, integer BOX(2,2), the indices of the lower left and upper right 
%    corners of the internal obstruction.
%
%    Local, real CHG(NX,NY), the charge distribution.
%
%    Local, real DEBYE, the Debye length.
%
%    Local, real DEN(NX,NY), the charge density.
%
%    Local, real DH, the "diameter" of a single cell.
%
%    Local, real DT, the time step.
%
%    Local, real E(2), the electric field experienced by a particle.
%
%    Local, real EFX(NX,NY), the X component of the electric field.
%
%    Local, real EFY(NX,NY), the Y component of the electric field.
%
%    Local, real EPS0, the permittivity of free space.
%
%    Local, real F, the Lorentz force experienced by a particle.
%
%    Local, real FLUX, the flux of entering particles.
%
%    Local, real K, the Boltzmann constant.
%    Oddly enough, this value seems never to be used.
%
%    Local, real M, the ion mass for molecular oxygen.
%
%    Local, real MP_Q, the macro-particle charge.
%
%    Local, integer N0, the average particle density per cubic meter.
%
%    Local, integer NN, the total number of nodes.
%
%    Local, integer NP, the number of particles.
%
%    Local, integer NP_INSERT, the number of (computational) particles inserted
%    per time step.
%
%    Local, real NPT, the number of real particles created per time step.
%
%    Local, integer NX, the number of nodes in the X direction.
%
%    Local, integer NY, the number of nodes in the Y direction.
%
%    Local, integer PART_MAX, the maximum number of particles.
%    Here, this is set to 20,000.
%
%    Local, real PART_V(NP,2), the X and Y velocities for each particle.
%
%    Local, real PART_X(NP,2), the X and Y coordinates for each particle.
%
%    Local, real PHI(NX,NY), the potential.
%
%    Local, real PHI_P, the wall potential.
%
%    Local, real PHI0, the reference potential.
%
%    Local, real QE, the elementary charge.
%
%    Local, integer SEED, a seed for the random number generator.
%
%    Local, real SPWT, the specific weight, real particles per macroparticle.
%
%    Local, integer STEP, the current time step.
%
%    Local, integer STEP_NUM, the number of time steps.
%
%    Local, real TE, the electron temperature in eV.
%
%    Local, real TI, the ion velocity in eV.
%
%    Local, real V_DRIFT, the ion injection velocity, 7 km/s.
%
%    Local, real VTH, the thermal velocity.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIC_SERIAL\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Apply the Particle in Cell (PIC) method to\n' );
  fprintf ( 1, '  an electrostatic problem that models the flow of\n' )
  fprintf ( 1, '  the "solar wind" around an electrically charged plate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It is worth considering how to turn this serial program\n' );
  fprintf ( 1, '  into one that uses parallel programming techniques.\n' );
%
%  Initialize the random number generator.
%
  seed = 123456789;
% rng ( seed );
%
%  Set physical constants.
%
  eps0 = 8.854e-12;
  qe = 1.602e-19;
  k = 1.381e-23;
  amu = 1.661e-27;
  m = 32.0 * amu;
%
%  Set problem parameters.
%
  n0 = 1.0e12;
  phi0 = 0.0;
  te = 1.0;
  ti = 0.1;
  v_drift = 7000.0;
  phi_p = -5.0;
%
%  Calculate plasma parameters.
%
  debye = sqrt ( eps0 * te / ( n0 * qe ) );
  vth = sqrt ( 2.0 * qe * ti / m );
%
%  Set the simulation domain.
%
  nx = 16;
  ny = 10;
  nn = nx * ny;
  step_num = 200;
  dh = debye;
  np_insert = ( ny - 1 ) * 15;
%
%  Compute other quantities.
%
  dt = 0.1 * dh / v_drift;
  width = ( nx - 1 ) * dh;
  height = ( ny - 1 ) * dh;
%
%  Indices of the corners of the obstruction.
%
  ox1 = floor ( nx / 3 );
  ox2 = floor ( nx / 3 ) + 2;
  oy1 = 1;
  oy2 = floor ( ny / 2 );
%
%  Indices of the corners of the obstruction, in an array.
%
  box(1,1) = floor ( nx / 3 );
  box(1,2) = floor ( nx / 3 ) + 2;
  box(2,1) = 1;
  box(2,2) = floor ( ny / 2 );
%
%  Calculate the specific weight.
%
  flux = n0 * v_drift * height;
  npt = flux * dt;
  spwt = npt / np_insert;
  mp_q = 1.0;
  part_max = 20000;
%
%  Allocate particle arrays.
% 
  part_x = zeros(part_max,2);
  part_v = zeros(part_max,2);
%
%  Set the finite difference stencil matrix.
%
  A = stencil ( nx, ny, dh, box );

  phi = ones ( nx, ny ) * phi0;

  np = 0;
%
%   Time loop
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Time  Particles\n' );
  fprintf ( 1, '\n' );

  for step = 1 : step_num
%
%  1. CALCULATE THE CHARGE DENSITY.
%
    chg = zeros(nx,ny);

    for p = 1 : np

      fi = 1.0 + part_x(p,1) / dh;
      i = floor ( fi );
      hx = fi - i;

      fj = 1.0 + part_x(p,2) / dh;
      j = floor ( fj );
      hy = fj - j;

      chg(i,  j)   = chg(i,  j)   + ( 1.0 - hx ) * ( 1.0 - hy );
      chg(i+1,j)   = chg(i+1,j)   +         hx   * ( 1.0 - hy );
      chg(i,  j+1) = chg(i,  j+1) + ( 1.0 - hx ) *         hy;
      chg(i+1,j+1) = chg(i+1,j+1) +         hx   *         hy;

    end
%
%  Calculate the density.
%  Along the boundaries, the calculated density must be doubled.
%  Add a density floor for plotting, and to help the solver.
%
    den(1:nx,1:ny) = spwt * mp_q * chg(1:nx,1:ny) / ( dh * dh );

    den(1,:)  = 2.0 * den(1,:);
    den(nx,:) = 2.0 * den(nx,:);
    den(:,1)  = 2.0 * den(:,1);
    den(:,ny) = 2.0 * den(:,ny);

    den = den + 10000.0;
%
%  2. CALCULATE THE POTENTIAL.
%
    phi = eval_2dpot_gs ( nx, ny, phi, A, den, n0, phi0, te, phi_p, box, ...
      eps0, qe );
%
%  3. CALCULATE THE ELECTRIC FIELD.
%  Use central differences at internal nodes,
%  forward or backward differences at boundaries.
%
    efx = zeros(nx,ny);
    efy = zeros(nx,ny);

    efx(2:nx-1,:) = ( phi(1:nx-2,:) - phi(3:nx,:) ) / ( 2.0 * dh );
    efy(:,2:ny-1) = ( phi(:,1:ny-2) - phi(:,3:ny) ) / ( 2.0 * dh );

    efx(1,:)  = ( phi(1,:)    - phi(2,:) )  / dh;
    efx(nx,:) = ( phi(nx-1,:) - phi(nx,:) ) / dh;
    efy(:,1)  = ( phi(:,1)    - phi(:,2) )  / dh;
    efy(:,ny) = ( phi(:,ny-1) - phi(:,ny) ) / dh;
%
%  4. GENERATE NEW PARTICLES
%
    if ( part_max - np <= np_insert  )
%     np_insert = part_max - np;
    end
%
%  The new particles have coordinates randomly chosen within the first X layer,
%  and any Y layer.
%
    part_x(np+1:np+np_insert,1) = rand ( np_insert, 1 ) * dh;
    part_x(np+1:np+np_insert,2) = rand ( np_insert, 1 ) * height;
%
%  Sample Maxwellian in x and y, add drift velocity in x.
%
    part_v(np+1:np+np_insert,1) = v_drift ...
      + ( - 1.5 + rand(np_insert,1) + rand(np_insert,1) ...
      + rand(np_insert,1) ) * vth;

    part_v(np+1:np+np_insert,2) = 0.5 ...
      * ( - 1.5 + rand(np_insert,1) + rand(np_insert,1) ...
      + rand(np_insert,1) ) * vth;

    np = np + np_insert;
%
%  5. MOVE ALL THE PARTICLES
%
    p = 1;

    while ( p <= np )

      fi = 1.0 + part_x(p) / dh;
      i = floor ( fi );
      hx = fi - i;

      fj = 1.0 + part_x(p,2) / dh;
      j = floor ( fj );
      hy = fj - j;

      e = [ 0.0, 0.0 ];
      e =     [ efx(i,j),     efy(i,j)     ] * ( 1.0 - hx ) * ( 1.0 - hy );
      e = e + [ efx(i+1,j),   efy(i+1,j)   ] *         hx   * ( 1.0 - hy );
      e = e + [ efx(i,j+1),   efy(i+1,j)   ] * ( 1.0 - hx ) *         hy;
      e = e + [ efx(i+1,j+1), efy(i+1,j+1) ] *         hx   *         hy;
%
%  Compute the Lorentz force and the corresponding acceleration.
%  Then update the particle velocity and position.
%
      f = qe * e;
      acc = f / m;
      part_v(p,:) = part_v(p,:) + acc * dt;
      part_x(p,:) = part_x(p,:) + part_v(p,:) * dt;
%
%  The bottom boundary is reflective.
%
      if ( part_x(p,2) < 0 )
        part_x(p,2) = - part_x(p,2);
        part_v(p,2) = - part_v(p,2);
      end
%
%  Is the particle inside the plate?
%
      in_box = ( box(1,1) <= i && i < box(1,2) && ...
                 box(2,1) <= j && j < box(2,2) );
%
%  Particle is absorbed if it passes left, right or top boundaries, 
%  or is inside the plate.
%  Kill the particle by replacing it with the last particle.
%
      if ( part_x(p,1) < 0.0 || width <= part_x(p,1) || height <= part_x(p,2) || in_box )
        part_x(p,:) = part_x(np,:);
        part_v(p,:) = part_v(np,:);
        np = np - 1;
        p = p - 1;
      end

      p = p + 1;

    end
%
%  6. PLOT RESULTS
%
    if ( mod ( step, 25 ) == 0 || step == step_num )

      figure ( 1 );
      clf
      hold on
      contourf ( den' );
      colorbar;
      patch ( [ ox1 ox2 ox2 ox1 ], [ oy1, oy1, oy2, oy2 ], 'w' )
      title ( sprintf ( 'Density on step %i', step ), 'Fontsize', 16 );
      hold off;

      figure ( 2 );
      clf
      hold on
      contourf ( phi' );
      patch ( [ ox1 ox2 ox2 ox1 ], [ oy1, oy1, oy2, oy2 ], 'w' )
      title ( sprintf ( 'Potential on step %i', step ), 'Fontsize', 16 );
      colorbar;
      hold off

      drawnow;

    end

    fprintf ( 1, '  %6i  %9i\n', step, np );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIC_SERIAL\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function phi = eval_2dpot_gs ( nx, ny, phi, A, den, n0, phi0, te, phi_p, ...
  box, eps0, qe )

%*****************************************************************************80
%
%% EVAL_2DPOT_GS computes the 2D potential using Gauss-Seidel iteration.
%
%  Discussion:
%
%    For more information, refer to 
%      http://www.particleincell.com/2010/es-pic-method/
%    and 
%      http://www.particleincell.com/2011/particle-in-cell-example/
%
%  Modified:
%
%    05 July 2013
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes in the X and Y directions.
%
%    Input, real PHI(NX,NY), the current potential function.
%
%    Input, real A(NX*NY,NX*NY), the finite difference stencil matrix.
%
%    Input, real DEN(NX,NY), the charge density.
%
%    Input, real PHI0, the reference potential.
%
%    Input, real TE, the electron temperature in eV.
%
%    Input, real EPS0, the permittivity of free space.
%
%    Input, real QE, the elementary charge.
%
%    Output, real PHI(NX,NY), the updated potential function.
%
  nn = nx * ny;
%
%  Solver tolerance.
%
  tol = 0.1;
%
%  Convert the density and potential into column vectors.
%
  den = reshape ( den, numel(den), 1 );
  phi = reshape ( phi, numel(phi), 1 );
%
%  Carry out the Gauss-Seidel iteration.
%
  for it = 1 : 2000
%  
%  Recalculate the right hand side, adding Boltzmann term for the electrons.
%
    b = den - n0 * exp ( ( phi - phi0 ) / te );
    b = - b * qe / eps0;
% 
%  Set the boundaries.
%  Zero electric field on y = 0, y = L, x = L.
%  Fixed potential on X = 0.
%
    b(1:nx) = 0.0;
    b(nn-nx+1:nn) = 0.0;
    b(nx:nx:nn) = 0.0;
    b(1:nx:nn) = phi0;
%
%  Set the potential on the fixed nodes.
%
    for j = box(2,1) : box(2,2)
      b([box(1,1):box(1,2)]+(j-1)*nx) = ones ( box(1,2)-box(1,1)+1, 1 ) * phi_p;
    end
%
%  Apply the Gauss-Seidel update to the current solution estimate.
%
    for i = 1 : nn
      phi(i) = ( b(i) - A(i,1:i-1)  * phi(1:i-1) ...
                      - A(i,i+1:nn) * phi(i+1:nn) ) / A(i,i);
    end
%
%  Compute the residual.
%
    if ( mod ( it, 10 ) == 0 )
      res = norm ( b - A * phi );
      if ( res <= tol )
        phi = reshape ( phi, nx, ny );
        return;
      end
    end

  end
%
%  Check if the solver converged.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EVAL_2DPOT_GS - Warning\n' );
  fprintf ( 1, '  The Gauss-Seidel iteration did not converge.\n' );
  fprintf ( 1, '  Residual norm = %g\n', res );

  phi = reshape ( phi, nx, ny );

  return
end
function A = stencil ( nx, ny, dh, box )

%*****************************************************************************80
%
%% STENCIL sets up the finite difference stencil matrix.
%
%  Modified:
%
%    05 July 2013
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes in the X and Y directions.
%
%    Local, real DH, the "diameter" of a single cell.
%
%    Input, integer BOX(2,2), contains the coordinates of the lower left
%    and upper right corners of the box.
%
%    Output, real A(NX*NY,NX*NY), the finite difference stencil matrix.
%
  A = zeros ( nx*ny, nx*ny );
%
%  For internal nodes, here are the node numberings for the
%  north, west, central, east, and south locations:
%
%             u-nx
%      u-1    u      u+1
%             u+nx
%
  for j = 2 : ny - 1
    for i = 2 : nx - 1

      u = ( j - 1 ) * nx + i;

      A(u,u)    = -4.0 / ( dh * dh );
      A(u,u-1)  =  1.0 / ( dh * dh );
      A(u,u+1)  =  1.0 / ( dh * dh );
      A(u,u-nx) =  1.0 / ( dh * dh );
      A(u,u+nx) =  1.0 / ( dh * dh );

    end  
  end
%
%  Neumann boundary on y=0
%
  j = 1;
  for i = 1 : nx
    u = ( j - 1 ) * nx + i;
    A(u,u)    = -1.0 / dh;
    A(u,u+nx) =  1.0 / dh;
  end
%
%  Neumann boundary on y=height
%
  j = ny;
  for i = 1 : nx
    u = ( j - 1 ) * nx + i;
    A(u,u-nx) =  1.0 / dh;
    A(u,u)    = -1.0 / dh;
  end
%
%  Neumann boundary on x=width
%
  i = nx;
  for j = 1 : ny
    u = ( j - 1 ) * nx + i;
    A(u,:) = zeros ( 1, nx * ny );
    A(u,u-1) =  1.0 / dh;
    A(u,u)   = -1.0 / dh;
  end
%
%  Dirichlet boundary on x=0
%
  i = 1;
  for j = 1 : ny
    u = ( j - 1 ) * nx + i;
    A(u,:) = zeros ( 1, nx * ny );
    A(u,u) = 1.0;
  end
%
%  Dirichlet boundary on nodes corresponding to the plate
%
  for j = box(2,1) : box(2,2)
    for i = box(1,1) : box(1,2)
      u = ( j - 1 ) * nx + i;
      A(u,:) = zeros ( 1, nx * ny );
      A(u,u) = 1.0;
    end
  end

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
