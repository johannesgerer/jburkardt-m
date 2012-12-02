function ncc_tetrahedron_test ( )

%*****************************************************************************80
%
%% NCC_TETRAHEDRON_TEST is the main program for the NCC_TETRAHEDRON sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCC_TETRAHEDRON_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NCC_TETRAHEDRON library.\n' );

  ncc_tetrahedron_test01 ( );
  ncc_tetrahedron_test02 ( );
  ncc_tetrahedron_test03 ( );
  ncc_tetrahedron_test04 ( );
  ncc_tetrahedron_test05 ( );
  ncc_tetrahedron_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCC_TETRAHEDRON_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
