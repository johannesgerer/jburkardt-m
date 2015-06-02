function square_hex_grid_test ( )

%*****************************************************************************80
%
%% SQUARE_HEX_GRID_TEST tests the SQUARE_HEX_GRID library.
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
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SQUARE_HEX_GRID library.\n' );
%
%  Tests on the unit square.
%
  square_hex_grid_test01 ( );
  square_hex_grid_test02 ( );
  square_hex_grid_test03 ( );
  square_hex_grid_test04 ( );
  square_hex_grid_test05 ( );
  square_hex_grid_test06 ( );
%
%  Tests on an arbitrary rectangle.
%
  square_hex_grid_test07 ( );
  square_hex_grid_test08 ( );
  square_hex_grid_test09 ( );
  square_hex_grid_test10 ( );
  square_hex_grid_test11 ( );
  square_hex_grid_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_HEX_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
