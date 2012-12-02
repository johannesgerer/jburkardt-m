function hex_grid_test ( )

%*****************************************************************************80
%
%% HEX_GRID_TEST tests HEX_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEX_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HEX_GRID library.\n' );
%
%  Tests on the unit square.
%
  hex_grid_test01 ( );
  hex_grid_test02 ( );
  hex_grid_test03 ( );
  hex_grid_test04 ( );
  hex_grid_test05 ( );
  hex_grid_test06 ( );
%
%  Tests on an arbitrary rectangle.
%
  hex_grid_test07 ( );
  hex_grid_test08 ( );
  hex_grid_test09 ( );
  hex_grid_test10 ( );
  hex_grid_test11 ( );
  hex_grid_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEX_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
