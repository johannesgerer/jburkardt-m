function orbital_decay ( )

%*****************************************************************************80
%
%% ORBITAL_DECAY simulates the decay of an orbit to an equilibrium.
%
%  Discussion:
%
%    Given two massive bodies subject to gravity, it is possible to write down
%    differential equations describing their motion.  These equations are
%    simpler to formulate in the frame of reference in which the center of 
%    mass of the two bodies does not move.  If one body is much more massive 
%    than the other, then our calculations in this new frame are essentially
%    the same as in the original geometry.  This is the case when one body
%    is the sun, and another a planet.  
%
%    By giving an arbitrary initial condition for the system, we are likely
%    to have a planet whose orbit is not the classical ellipse we would
%    expect.  However, if we follow the orbit over time, we will see it
%    gradually decay to an ellipse.
%
%    This simulation would need to be modified if we wanted to consider
%    the behavior of two bodies of comparable mass, and expected to see
%    them both moving, or, even in the sun-planet case, if we wanted to
%    allow the sun to have a velocity while we stayed in a fixed frame
%    of reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ORBITAL_DECAY\n' );
  fprintf ( 1, '  This simulation follows a small body for 20 orbits\n' );
  fprintf ( 1, '  around a relatively massive body - such as Mercury around\n' );
  fprintf ( 1, '  the sun.\n' );
  fprintf ( 1, '  Kepler''s equations for a two body system are used.\n' );
  fprintf ( 1, '  Initially, the orbit is NOT an ellipse, but as time passes,\n' );
  fprintf ( 1, '  the orbit decays into an elliptical shape.\n' );

  x0 = [ 1.0, 0.0, 0.0, 0.8 ];
  tmin = 0.0;
  tmax = 20.0 * 3.895;

  sol = ode45 ( @kepler, [ tmin, tmax ], x0 );

  clf

  hold on

  tvec = linspace ( tmin, tmax, 1000 );
  xvec = deval ( sol, tvec );
  plot ( xvec(1,:), xvec(3,:), 'b-' )

  plot ( 0.0, 0.0, 'r.', 'MarkerSize', 40 )

  grid on

  title ( 'After twenty orbits, we are almost elliptical' )
  axis equal
  hold off

  return
end
