function hex_grid_angle_test ( )

%*****************************************************************************80
%
%% HEX_GRID_ANGLE_TEST tests HEX_GRID_ANGLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEX_GRID_ANGLE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HEX_GRID_ANGLE library.\n' );

  hex_grid_angle_test01 ( );
  hex_grid_angle_test02 ( );
  hex_grid_angle_test03 ( );
  hex_grid_angle_test04 ( );
  hex_grid_angle_test05 ( );
  hex_grid_angle_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEX_GRID_ANGLE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

