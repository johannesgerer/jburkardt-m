%% SIMPLE_ODE113 solves the three body problem using MATLAB's ODE113.
%
%  Discussion:
%
%    Three bodies, regarded as point masses, are constrained to lie in a plane.
%    The masses of each body are given, as are the positions and velocities
%    at a starting time T = 0.  The bodies move in accordance with the gravitational
%    force between them.
%
%    The force exerted on the 0-th body by the 1st body can be written:
%
%      F = - m0 m1 ( p0 - p1 ) / |p0 - p1|^3
%
%    assuming that units have been normalized to that the gravitational
%    coefficient is 1.  Newton's laws of motion can be written:
%
%      m0 p0'' = - m0 m1 ( p0 - p1 ) / |p0 - p1|^3 
%                - m0 m2 ( p0 - p2 ) / |p0 - p2|^3
%
%      m1 p1'' = - m1 m0 ( p1 - p0 ) / |p1 - p0|^3 
%                - m1 m2 ( p1 - p2 ) / |p1 - p2|^3
%
%      m2 p2'' = - m2 m0 ( p2 - p0 ) / |p2 - p0|^3 
%                - m2 m1 ( p2 - p1 ) / |p2 - p1|^3
%
%    Letting
%
%      y1 = p0(x)
%      y2 = p0(y)
%      y3 = p0'(x)
%      y4 = p0'(y)
%
%    and using similar definitions for p1 and p2, the 3 second order vector 
%    equations can be rewritten as 12 first order equations.  In particular,
%    the first four are:
%
%      y1' = y3
%      y2' = y4
%      y3' = - m1 ( y1 - y5  ) / |(y1,y2) - (y5,y6) |^3 
%            - m2 ( y1 - y9  ) / |(y1,y2) - (y9,y10)|^3
%      y4' = - m1 ( y2 - y6  ) / |(y1,y2) - (y5,y6) |^3 
%            - m2 ( y2 - y10 ) / |(y1,y2) - (y9,y10)|^3
%
%    and so on.
%
%    This first order system can be integrated by a standard ODE solver.
%
%    Note that when any two bodies come close together, the solution changes
%    very rapidly, and very small steps must be taken by the ODE solver.
%    For this system, the first near collision occurs around T=15.8299, and
%    the results produced by MATLAB's ode113 will not be very accurate after
%    that point.
%
%  Modified:
%
%    03 April 2011
%
%  Author:
%
%    Dominik Gruntz, Joerg Waldvogel
%
%  Reference:
%
%    Dominik Gruntz, Joerg Waldvogel,
%    "Orbits in the Planar Three-Body Problem",
%    Walter Gander, Jiri Hrebicek,
%    Solving Problems in Scientific Computing using Maple and Matlab,
%    Springer, 1997,
%    ISBN: 3-540-61793-0,
%    LC: Q183.9.G36.
%
  global m0 m1 m2

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLE_ODE113:\n' );
  fprintf ( 1, '  A simple formulation of the planar three-body problem.\n' );
  fprintf ( 1, '  This program uses ODE113 for the ODE solver.\n' );
%
%  Set the masses.
%
  m0 = 5.0;
  m1 = 3.0;
  m2 = 4.0;
%
%  Set the time range.
%
  t_initial = 0.0;
  t_final = 63.0;
  t_range = [ t_initial, t_final ];
%
%  For bodies 1, 2, and 3, give initial values for:
%    (X,Y) position,
%    (X,Y) velocity.
%
  x_initial = [ 1.0; -1.0;  0.0;  0.0;
                1.0;  3.0;  0.0;  0.0;
               -2.0; -1.0;  0.0;  0.0 ];
%
%  Set error tolerances.
%
  options = odeset ( 'RelTol', 1.0e-10, 'AbsTol', 1.0E-10 );
%
%  Integrate the ODE.
%
  [ T1, Y1 ] = ode113 ( 'simple_f', t_range, x_initial, options );
%
%  Display the results.
%
  figure ( 1 )

  [ ~, i10 ] = min ( abs ( T1 - 10.0 ) );

  R1 = 1 : i10;

  plot ( Y1(R1,1), Y1(R1,2), 'b.', ...
         Y1(R1,5), Y1(R1,6), 'r.', ...
         Y1(R1,9), Y1(R1,10), 'g.' )
  title ( '0 <= T <= 10' )

  figure ( 2 )

  [ ~, i20 ] = min ( abs ( T1 - 20.0 ) );

  R2 = i10 : i20;

  plot ( Y1(R2,1), Y1(R2,2), 'b.', ...
         Y1(R2,5), Y1(R2,6), 'r.', ...
         Y1(R2,9), Y1(R2,10), 'g.' )
  title ( '10 <= T <= 20' )

  figure ( 3 )

  [ ~, i50 ] = min ( abs ( T1 - 50.0 ) );
  i63 = length ( T1 );

  R3 = i50 : i63;

  plot ( Y1(R3,1), Y1(R3,2), 'b.', ...
         Y1(R3,5), Y1(R3,6), 'r.', ...
         Y1(R3,9), Y1(R3,10), 'g.' )
  title ( '50 <= T <= 63' )

  figure ( 4 )

  R4 = 1 : i63;

  plot ( Y1(R4,1), Y1(R4,2), 'b.', ...
         Y1(R4,5), Y1(R4,6), 'r.', ...
         Y1(R4,9), Y1(R4,10), 'g.' )
  title ( '0 <= T <= 63' )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLE_ODE113:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
