function test_mesh_test ( )

%*****************************************************************************80
%
%% TET_MESH_TEST tests the routines in TET_MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TET_MESH library.\n' );

  tet_mesh_test001 ( );
  tet_mesh_test002 ( );
  tet_mesh_test003 ( );
  tet_mesh_test004 ( );
  tet_mesh_test005 ( );
  tet_mesh_test006 ( );
  tet_mesh_test007 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
