function cube_random_centralize_test ( )

%*****************************************************************************80
%
%% CUBE_RANDOM_CENTRALIZE_TEST tests CUBE_RANDOM_CENTRALIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_RANDOM_CENTRALIZE_TEST\n' );
  fprintf ( 1, '  Centralize random data from a cube surface.\n' );
  fprintf ( 1, '  The cube is aligned with coordinate axes.\n' );
  fprintf ( 1, '  The spatial dimension is M.\n' );
  fprintf ( 1, '  The number of sample points is N.\n' );
  fprintf ( 1, '  The cube center CC is at the origin.\n' );
  fprintf ( 1, '  The cube radius CR is 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The observation point OC may be:\n' );
  fprintf ( 1, '  * CENTERED: coinciding with CC, or\n' );
  fprintf ( 1, '  * OFFCENTERED: chosen at random within the cube\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate CC, and report R_MIN and R_MAX, the minimum\n' );
  fprintf ( 1, '  and maximum distances between OC and a data point.\n' );
  fprintf ( 1, '  Compute R_MIN and R_MAX for both centered and offcentered\n' );
  fprintf ( 1, '  observation points.\n' );

  seed = 123456789;
  rng ( seed );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M       N         CC error          R_MIN         ' );
  fprintf ( 1, 'R_MAX        R_MIN         R_MAX\n' );
  fprintf ( 1, '                                           (Centered)  ' );
  fprintf ( 1, '             (Offcentered)\n' );
  m = 2;
  for m_log = 1 : 7
    fprintf ( 1, '\n' );
    cc = zeros ( m, 1 );
    oc1 = zeros ( m, 1 );
    oc2 = rand ( m, 1 );
    n = 1;
    for n_log = 1 : 6
      cc = zeros ( m, 1 );
      cr = 1.0;
      [ cc_est, cr_min1, cr_max1 ] = cube_random_centralize ( m, n, oc1, cc, cr );
      [ cc_est, cr_min2, cr_max2 ] = cube_random_centralize ( m, n, oc2, cc, cr );
      cc_err = norm ( cc - cc_est );
      fprintf ( 1, '  %4d  %6d  %14.6g  %12.4g  %12.4g  %12.4g  %12.4g\n', ...
        m, n, cc_err, cr_min1, cr_max1, cr_min2, cr_max2 );
      n = n * 4;
    end
    m = m * 2;
  end

  return
end

