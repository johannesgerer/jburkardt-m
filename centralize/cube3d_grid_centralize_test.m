function cube3d_grid_centralize_test ( )

%*****************************************************************************80
%
%% CUBE3D_GRID_CENTRALIZE_TEST tests CUBE3D_GRID_CENTRALIZE.
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
  fprintf ( 1, 'CUBE3D_GRID_CENTRALIZE_TEST\n' );
  fprintf ( 1, '  Centralize projected hypersphere data from a cube surface.\n' );
  fprintf ( 1, '  The cube is aligned with coordinate axes.\n' );
  fprintf ( 1, '  The spatial dimension is M=3.\n' );
  fprintf ( 1, '  The hypersphere grid has 1D index NG,\n' );
  fprintf ( 1, '  and number of points N=(2*NG+1)*(NG+1).\n' );
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
  fprintf ( 1, '     M      N          CC error          R_MIN         ' );
  fprintf ( 1, 'R_MAX        R_MIN         R_MAX\n' );
  fprintf ( 1, '                                           (Centered)  ' );
  fprintf ( 1, '             (Offcentered)\n' );
  m = 3;
  fprintf ( 1, '\n' );
  cc = zeros ( m, 1 );
  oc1 = zeros ( m, 1 );
  oc2 = rand ( m, 1 );
  ng = 3;
  for i = 1 : 6
    n = ( 2 * ng + 1 ) * ( ng + 1 ) ^ ( m - 2 );
    cc = zeros ( m, 1 );
    cr = 1.0;
    [ cc_est, cr_min1, cr_max1 ] = cube3d_grid_centralize ( ng, oc1 );
    [ cc_est, cr_min2, cr_max2 ] = cube3d_grid_centralize ( ng, oc2 );
    cc_err = norm ( cc - cc_est );
    fprintf ( 1, '  %4d  %6d  %14.6g  %12.4g  %12.4g  %12.4g  %12.4g\n', ...
      m, n, cc_err, cr_min1, cr_max1, cr_min2, cr_max2 );
    ng = ( ng - 1 ) * 2 + 1;
  end

  return
end

