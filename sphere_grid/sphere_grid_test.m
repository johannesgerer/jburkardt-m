function sphere_grid_test ( )

%*****************************************************************************80
%
%% SPHERE_GRID_TEST tests the SPHERE_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_GRID library.\n' );

  sphere_grid_test01 ( );
  sphere_grid_test02 ( );
  sphere_grid_test03 ( );
  sphere_grid_test04 ( );
  sphere_grid_test05 ( );
  sphere_grid_test06 ( );
  sphere_grid_test07 ( );
  sphere_grid_test08 ( );
  sphere_grid_test09 ( );
  sphere_grid_test10 ( );
  sphere_grid_test11 ( );
  sphere_grid_test12 ( );
  sphere_grid_test13 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
