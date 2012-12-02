function brownian_motion_simulation_test ( )

%*****************************************************************************80
%
%% BROWNIAN_MOTION_SIMULATION_TEST tests the BROWNIAN_MOTION_SIMULATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BROWNIAN_MOTION_SIMULATION_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BROWNIAN_MOTION_SIMULATION library.\n' );
%
%  Compute the path of a particle undergoing Brownian motion.
%
  for m = 1 : 3
    n = 1001;
    d = 10.0;
    t = 1.0;
    x = brownian_motion_simulation ( m, n, d, t );
    brownian_motion_display ( m, n, x );
  end
%
%  Estimate the average displacement of the particle from the origin
%  as a function of time.
%
  for m = 1 : 3
    k = 40;
    n = 1001;
    d = 10.0;
    t = 1.0;

    dsq = brownian_displacement_simulation ( k, n, m, d, t );
    brownian_displacement_display ( k, n, m, d, t, dsq );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BROWNIAN_MOTION_SIMULATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
