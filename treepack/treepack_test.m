function treepack_test ( )

%*****************************************************************************80
%
%% TREEPACK_TEST tests the TREEPACK library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TREEPACK library.\n' );

  treepack_test005 ( )
  treepack_test006 ( )
  treepack_test01 ( )
  treepack_test02 ( )
  treepack_test025 ( )
  treepack_test03 ( )
  treepack_test04 ( )
  treepack_test05 ( )
  treepack_test06 ( )
  treepack_test07 ( )
  treepack_test08 ( )
  treepack_test09 ( )

  treepack_test10 ( )
  treepack_test11 ( )
  treepack_test12 ( )
  treepack_test13 ( )
  treepack_test14 ( )
  treepack_test15 ( )
  treepack_test16 ( )
  treepack_test17 ( )
  treepack_test18 ( )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( )

  return
end

