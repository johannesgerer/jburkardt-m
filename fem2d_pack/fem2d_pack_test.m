function fem2d_pack_test ( )

%*****************************************************************************80
%
%% FEM2D_PACK_TEST tests the FEM2D_PACK library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 January 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_PACK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM2D_PACK library.\n' );

  fem2d_pack_test01 ( );
  fem2d_pack_test02 ( );
  fem2d_pack_test03 ( );
  fem2d_pack_test04 ( );
  fem2d_pack_test05 ( );
  fem2d_pack_test06 ( );
  fem2d_pack_test07 ( );
  fem2d_pack_test08 ( );
  fem2d_pack_test09 ( );

  fem2d_pack_test10 ( );
  fem2d_pack_test105 ( );
  fem2d_pack_test11 ( );
  fem2d_pack_test12 ( );
  fem2d_pack_test13 ( );
  fem2d_pack_test135 ( );
  fem2d_pack_test14 ( );
  fem2d_pack_test15 ( );
  fem2d_pack_test16 ( );
  fem2d_pack_test17 ( );
  fem2d_pack_test18 ( );
  fem2d_pack_test19 ( );

  fem2d_pack_test20 ( );
  fem2d_pack_test21 ( );
  fem2d_pack_test22 ( );
  fem2d_pack_test23 ( );
  fem2d_pack_test24 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_PACK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
