function nco_tetrahedron_test ( )

%*****************************************************************************80
%
%% NCO_TETRAHEDRON_TEST is the main program for the NCO_TETRAHEDRON sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCO_TETRAHEDRON_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NCO_TETRAHEDRON library.\n' );

  nco_tetrahedron_test01 ( );
  nco_tetrahedron_test02 ( );
  nco_tetrahedron_test03 ( );
  nco_tetrahedron_test04 ( );
  nco_tetrahedron_test05 ( );
  nco_tetrahedron_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCO_TETRAHEDRON_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
