function reactor_simulation ( )

%*****************************************************************************80
%
%% MAIN is the main program for the reactor shielding simulation.
%
%  Discussion:
%
%    This is a Monte Carlo simulation, using
%    uniform random numbers, which investigates the
%    effectiveness of a shield intended to absorb the
%    neutrons emitted from a nuclear reactor.
%   
%    The reactor is modeled as a point source,
%    located at (0,0,0).
%   
%    A particle emitted from the reactor has a random
%    initial direction, and an energy selected from
%    [Emin,Emax] with a 1/Sqrt(E) distribution.
%   
%    The shield is modeled as a wall of thickness THICK,
%    extending from 0 to THICK in the X direction, and
%    extending forever in the Y and Z directions.
%   
%    Based on the particle energy, a distance D is computed
%    which measures how far the particle could travel through
%    the shield before colliding.
%   
%    Based on the particle direction, the position is updated
%    by D units.
%   
%    If the particle is now to the left of the shield, it is
%    counted as being REFLECTED.
%   
%    If the particle is to the right of the shield, it is 
%    counted as being ABSORBED.
%   
%    If the particle is inside the shield, it has COLLIDED.
%    A particle that collides is either absorbed (end of story)
%    or SCATTERED with a new random direction and a new (lower)
%    energy.
%   
%    Every particle is followed from origin to its final fate,
%    which is reflection, transmission, or absorption.
%    At the end, a summary is printed, giving the number of
%    particles with each fate, and the average energy of each
%    group of particles.
%   
%    Increasing NTOT, the number of particles used, will improve the
%    expected reliability of the results.
%   
%    Increasing THICK, the thickness of the shield, should 
%    result in more absorptions and reflections.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Local Parameters:
%
%    Local, real AZM, the azimuthal angle of the particle's
%    direction.
%
%    Local, real D, the distance that the particle can
%    travel through the slab, given its current energy.
%
%    Local, real E, the energy of the particle.
%
%    Local, real EA, energy absorbed by the slab.
%
%    Local, real ER, energy reflected by the slab.
%
%    Local, real ET, energy transmitted through the slab.
%
%    Local, real MU, the cosine of the angle between the
%    particle's direction and the X axis.
%
%    Local, integer NA, number of particles absorbed by the slab.
%
%    Local, integer NPART, the index of the current particle.
%
%    Local, integer NR, number of particles reflected by the slab.
%
%    Local, integer NT, number of particles transmitted by the slab.
%
%    Local, integer NTOT, the total number of particles to be
%    emitted from the neutron source.
%
%    Local, real SA, standard deviation of absorbed energy.
%
%    Local, real SR, standard deviation of reflected energy.
%
%    Local, real ST, standard deviation of transmitted energy.
%
%    Local, real THICK, the thickness of the slab that is
%    intended to absorb most of the particles.
%
%    Local, real X, Y, Z, the current position of the particle.
%
  ntot = 100000;
  test_num = 5;
  thick = 2.0;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'REACTOR_SIMULATION\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  The reactor shielding simulation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Shield thickness is THICK = %g\n', thick );
  fprintf ( 1, '  Number of simulated particles is NTOT = %d\n', ntot );
  fprintf ( 1, '  Number of tests TEST_NUM = %d\n', test_num );

  seed = 123456789;

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test # %d\n', test );
    fprintf ( 1, '  SEED = %d\n', seed );
%
%  Initialize.
%
    ea = 0.0;
    er = 0.0;
    et = 0.0;
    na = 0;
    nr = 0;
    nt = 0;
    sa = 0.0;
    sr = 0.0;
    st = 0.0;
%
%  Main loop over NTOT particles.
%
    for npart = 1 : ntot
%
%  Generate a new particle.
%
      [ seed, e, mu, azm, x, y, z ] = source ( seed );

      while ( 1 )
%
%  Compute the distance that the particle can travel through the slab,
%  based on its current energy.
%
        [ d, seed ] = dist2c ( e, seed );
%
%  Update the particle's position by D units.
%
        [ x, y, z ] = update ( mu, azm, d, x, y, z );
%
%  The particle was reflected by the shield, and this path is complete.
%
        if ( x < 0.0 )

          nr = nr + 1;
          er = er + e;
          sr = sr + e * e;
          break
%
%  The particle was transmitted through the shield, and this path is complete.
%
        elseif ( thick < x )

          nt = nt + 1;
          et = et + e;
          st = st + e * e;
          break
%
%  The particle collided with the shield, and was absorbed.  This path is done.
%
        else

          [ absorbed, seed ] = absorb ( seed );

          if ( absorbed )

            na = na + 1;
            ea = ea + e;
            sa = sa + e * e;
            break
%
%  The particle collided with the shield and was scattered.
%  Find the scattering angle and energy, and continue along the new path.
%
          else

            [ mu, azm, e, seed ] = scatter ( seed, e );

          end

        end

      end

    end
%
%  Print the results of the simulation.
%
    output ( na, ea, sa, nr, er, sr, nt, et, st, ntot );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'REACTOR_SIMULATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ value, seed ] = absorb ( seed )

%*****************************************************************************80
%
%% ABSORB determines if a colliding particle is absorbed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, logical VALUE, is TRUE if the particle is absorbed.
%
%  Local parameters:
%
%    Local, real PA, the probability of absorption.
%
  pa = 0.1;

  [ u, seed ] = r8_uniform_01 ( seed );

  if ( u <= pa )
    value = 1;
  else
    value = 0;
  end

  return
end
function value = cross ( e )

%*****************************************************************************80
%
%% CROSS returns the "cross section" of a particle based on its energy.
%
%  Discussion:
%
%    The particle's cross section is a measure of its likelihood to collide
%    with the material of the slab.  This quantity typically depends on both
%    the particle's energy and the kind of medium through which it is traveling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real E, the energy of the particle.
%
%    Output, real VALUE, the cross section.
%
  s = abs ( sin ( 100.0 * ( exp ( e ) - 1.0 ) ) ...
    + sin ( 18.81 * ( exp ( e ) - 1.0 ) ) );

  y = max ( 0.02, s );

  value = 10.0 * exp ( -0.1 / y );

  return
end
function [ value, seed ] = dist2c ( e, seed )

%*****************************************************************************80
%
%% DIST2C returns the distance to collision.
%
%  Discussion:
%
%    Assuming the particle has a given energy, and assuming it is currently
%    somewhere inside the shield, it is possible to determine a typical distance
%    which the particle can travel before it collides with the material of
%    the shield.
%
%    The computation of the collision distance is made by estimating a
%    "cross section" (as though having more energy made the particle "bigger"
%    and hence more likely to collide) and then randomly selecting a distance
%    that is logarithmically distributed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real E, the energy of the particle.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real VALUE, the distance the particle can travel
%    through the slab before colliding.
%
  [ u, seed ] = r8_uniform_01 ( seed );

  value = - log ( u ) / cross ( e );

  return
end
function [ value, seed ] = energy ( seed )

%*****************************************************************************80
%
%% ENERGY assigns an energy to an emitted particle.
%
%  Discussion:
%
%    The energy E is in the range [EMIN,EMAX], with distribution
%    const/sqrt(energy).
%
%    An inverse function approach is used to compute this.
%
%    The energies are measured in MeV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real VALUE, a randomly chosen energy that is
%    distributed as described above.
%
%  Local parameters:
%
%    Local, real EMIN, EMAX, the minimum and maximum
%    energies.
%
  emax = 2.5;
  emin = 1.0E-03;

  [ u, seed ] = r8_uniform_01 ( seed );

  c = 1.0 / ( 2.0 * ( sqrt ( emax ) - sqrt ( emin ) ) );

  value = ( u / ( 2.0 * c ) + sqrt ( emin ) );
  value = value * value;

  return
end
function output ( na, ea, sa, nr, er, sr, nt, et, st, ntot )

%*****************************************************************************80
%
%% OUTPUT prints the results of the reactor shielding simulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, integer NA, number of particles absorbed by the slab.
%
%    Input, real EA, energy absorbed by the slab.
%
%    Input, real SA, the sum of the squares of the 
%    absorbed energies.
%
%    Input, integer NR, number of particles reflected by the slab.
%
%    Input, real ER, energy reflected by the slab.
%
%    Input, real SR, the sum of the squares of the 
%    reflected energies.
%
%    Input, integer NT, number of particles transmitted by the slab.
%
%    Input, real ET, energy transmitted through the slab.
%
%    Input, real ST, the sum of the squares of the 
%    transmitted energies.
%
%    Input, integer NTOT, the total number of particles.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Reactor Shielding Problem:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                           Total                   Average\n' );
  fprintf ( 1, '                    #      Energy      ' );
  fprintf ( 1, 'Percent     Energy         StDev\n' );
  fprintf ( 1, '\n' );

  etot = ea + er + et;

  if ( 0 < na )
    ea_ave = ea / na;
    sa = sqrt ( sa / na - ea_ave * ea_ave );
  else
    ea_ave = 0.0;
  end

  pa = na * 100 / ntot;

  fprintf ( 1, 'Absorbed     %8d  %14g  %6.2f  %14g  %14g\n', ...
    na, ea, pa, ea_ave, sa );

  if ( 0 < nr )
    er_ave = er / nr;
    sr = sqrt ( sr / nr - er_ave * er_ave );
  else
    er_ave = 0.0;
  end

  pr = nr * 100 / ntot;

  fprintf ( 1, 'Reflected    %8d  %14g  %6.2f  %14g  %14g\n', ...
    nr, er, pr, er_ave, sr );

  if ( 0 < nt )
    et_ave = et / nt;
    st = sqrt ( st / nt - et_ave * et_ave );
  else
    et_ave = 0.0;
  end

  pt = nt * 100 / ntot;

  fprintf ( 1, 'Transmitted  %8d  %14g  %6.2f  %14g  %14g\n', ...
    nt, et, pt, et_ave, st );

  ptot = 100.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Total        %8d  %14g  %6.2f\n', ...
    ntot, etot, ptot );

  return
end
function [ r, seed ] = r8_uniform_01 ( seed )

%*****************************************************************************80
%
%% R8_UNIFORM_01 returns a unit pseudorandom R8.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2^31 - 1 )
%      r8_uniform_01 = seed / ( 2^31 - 1 )
%
%    The integer arithmetic never requires more than 32 bits,
%    including a sign bit.
%
%    If the initial seed is 12345, then the first three computations are
%
%      Input     Output      R8_UNIFORM_01
%      SEED      SEED
%
%         12345   207482415  0.096616
%     207482415  1790989824  0.833995
%    1790989824  2035175616  0.947702
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Springer Verlag, pages 201-202, 1983.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley Interscience, page 95, 1998.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.  SEED should not be 0.
%
%    Output, real R, a random value between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM_01 - Fatal error!' );
  end

  seed = floor ( seed );

  seed = mod ( seed, 2147483647 );

  if ( seed < 0 ) 
    seed = seed + 2147483647;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + 2147483647;
  end

  r = seed * 4.656612875E-10;

  return
end
function [ mu, azm, e, seed ] = scatter ( seed, e )

%*****************************************************************************80
%
%% SCATTER returns the new direction and energy of a particle that is scattered.
%
%  Discussion:
%
%    The scattering direction is chosen uniformly on the sphere.
%
%    The energy of the scattered particle is chosen uniformly in
%    [ 0.3*E, E ].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Input/output, real E.  On input, the particle energy
%    before collision.  On output, the particle energy after collision
%    and scattering.
%
%    Output, real MU, the cosine of the angle between the
%    particle's direction and the X axis.
%
%    Output, real AZM, the azimuthal angle of the particle's
%    direction.
%
  [ u, seed ] = r8_uniform_01 ( seed );
  mu = - 1.0 + 2.0 * u;

  [ u, seed ] = r8_uniform_01 ( seed );
  azm = u * 2.0 * pi;

  [ u, seed ] = r8_uniform_01 ( seed );
  e = ( u * 0.7 + 0.3 ) * e;

  return
end
function [ seed, e, mu, azm, x, y, z ] = source ( seed  )

%*****************************************************************************80
%
%% SOURCE generates a new particle from the neutron source.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real E, the initial energy of the particle.
%
%    Output, real MU, the cosine of the angle between the
%    particle's direction and the X axis.
%
%    Output, real AZM, the azimuthal angle of the particle's
%    direction.
%
%    Output, real X, Y, Z, the initial coordinates of the particle.
%
  [ u, seed ] = r8_uniform_01 ( seed );
  mu = u;

  [ u, seed ] = r8_uniform_01 ( seed );
  azm = u * 2.0 * pi;

  x = 0.0;
  y = 0.0;
  z = 0.0;

  [ e, seed ] = energy ( seed );

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
function [ x, y, z ] = update ( mu, azm, d, x, y, z )

%*****************************************************************************80
%
%% UPDATE determines the position of the particle after it has traveled D units.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2012
%
%  Author:
%
%    Original FORTRAN77 version by Kahaner, Moler, Nash.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real MU, the cosine of the angle between the
%    particle's direction and the X axis.
%
%    Input, real AZM, the azimuthal angle of the particle's
%    direction.
%
%    Input, real D, the distance the particle traveled.
%
%    Input/output, real X, Y, Z.  On input, the previous
%    coordinates of the particle.  On output, the updated coordinates of the
%    particle.
%
  s = sqrt ( 1.0 - mu * mu );

  x = x + d * mu;
  y = y + d * s * cos ( azm );
  z = z + d * s * sin ( azm );

  return
end
