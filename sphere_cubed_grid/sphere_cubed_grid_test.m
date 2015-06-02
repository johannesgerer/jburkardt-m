function sphere_cubed_grid_test ( )

%*****************************************************************************80
%
%% SPHERE_CUBED_GRID_TEST tests the SPHERE_CUBED_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_CUBED_GRID library.\n' );

  sphere_cubed_grid_point_count_test ( );
  sphere_cubed_grid_points_test ( );
  sphere_cubed_grid_points_face_test ( );
  sphere_cubed_grid_points_display_test ( );

  sphere_cubed_grid_ijk_to_xyz_test ( );
  sphere_cubed_grid_line_count_test ( );
  sphere_cubed_grid_lines_test ( );
  sphere_cubed_grid_lines_display_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_CUBED_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
