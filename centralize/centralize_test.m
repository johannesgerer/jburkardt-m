function centralize_test ( )

%*****************************************************************************80
%
%% CENTRALIZE_TEST tests the CENTRALIZE library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CENTRALIZE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CENTRALIZE library.\n' );

  cube_grid_centralize_test ( );
  cube_random_centralize_test ( );
  cube3d_grid_centralize_test ( );
  cube3d_grid_plot_test ( );
  sphere_random_centralize_test ( );
  ellipsoid_random_centralize_test ( );
  triangle_random_centralize_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CENTRALIZE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

