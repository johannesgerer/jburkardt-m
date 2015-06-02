function quad_mesh_test ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST tests the QUAD_MESH library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 March 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp (  );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QUAD_MESH library.\n' );

  quad_mesh_test01 ( );
  quad_mesh_test02 ( );
  quad_mesh_test03 ( );
  quad_mesh_test04 ( );
  quad_mesh_test05 ( );
  quad_mesh_test06 ( );
  quad_mesh_test062 ( );
  quad_mesh_test07 ( );
  quad_mesh_test072 ( );
  quad_mesh_test08 ( );
  quad_mesh_test09 ( );
  quad_mesh_test10 ( );
  quad_mesh_test105 ( );
  quad_mesh_test11 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
