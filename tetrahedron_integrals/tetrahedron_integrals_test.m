function tetrahedron_integrals ( )

%*****************************************************************************80
%
%% TETRAHEDRON_INTEGRALS_TEST tests the TETRAHEDRON_INTEGRALS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_INTEGRALS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TETRAHEDRON_INTEGRALS library.\n' );

  tetrahedron_integrals_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_INTEGRALS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
