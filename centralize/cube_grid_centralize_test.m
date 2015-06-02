function cube_grid_centralize_test ( )

%*****************************************************************************80
%
%% CUBE_GRID_CENTRALIZE_TEST tests CUBE_GRID_CENTRALIZE.
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
  fprintf ( 1, 'CUBE_GRID_CENTRALIZE_TEST\n' );
  fprintf ( 1, '  Centralize hypersphere grid projected data from a cube surface.\n' );
  fprintf ( 1, '  The cube is aligned with coordinate axes.\n' );
  fprintf ( 1, '  The spatial dimension is M.\n' );
  fprintf ( 1, '  The grid has an index NG.\n' );
  fprintf ( 1, '  The number of sample points is N=(2*NG+1)*(NG+1)^(M-2).\n' );
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
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  TEST #1: Use a centered observation point:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M    NG       N         CC error          R_MIN         R_MAX\n' );
  m = 2;

  for test = 1 : 4

    fprintf ( 1, '\n' );
    cc = zeros ( m, 1 );
    oc = zeros ( m, 1 );

    for ng = 2 : 5

      n = 2 * ng * ( ng - 1 ) ^ ( m - 2 );
      cc = zeros ( m, 1 );
      cr = 1.0;

      [ cc_est, cr_min, cr_max ] = cube_grid_centralize ( m, ng, oc, cc, cr );
      cc_err = norm ( cc - cc_est );

      fprintf ( 1, '  %4d  %4d  %6d  %14.6g  %12.4g  %12.4g\n', ...
        m, ng, n, cc_err, cr_min, cr_max );

    end

    m = m + 2;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  TEST #2: Use an offcentered observation point:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M    NG       N         CC error          R_MIN         R_MAX\n' );
  m = 2;

  for test = 1 : 4

    fprintf ( 1, '\n' );
    cc = zeros ( m, 1 );
    oc = rand ( m, 1 );

    for ng = 2 : 5

      n = 2 * ng * ( ng - 1 ) ^ ( m - 2 );
      cc = zeros ( m, 1 );
      cr = 1.0;

      [ cc_est, cr_min, cr_max ] = cube_grid_centralize ( m, ng, oc, cc, cr );
      cc_err = norm ( cc - cc_est );

      fprintf ( 1, '  %4d  %4d  %6d  %14.6g  %12.4g  %12.4g\n', ...
        m, ng, n, cc_err, cr_min, cr_max );

    end

    m = m + 2;

  end

  return
end

