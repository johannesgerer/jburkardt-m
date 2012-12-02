function fem3d_pack_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEM3D_PACK_TEST.
%
%  Discussion:
%
%    FEM3D_PACK_TEST calls the various FEM3D_PACK tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM3D_PACK_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM3D_PACK library.\n' );

  basis_mn_tet4_test ( );
  basis_mn_tet10_test ( );
  basis_brick8_test ( );
  basis_brick20_test ( );
  basis_brick27_test ( );
  fem3d_pack_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM3D_PACK_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
