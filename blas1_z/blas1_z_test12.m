function blas1_z_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests ZMACH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n');
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  ZMACH computes several machine-dependent\n' );
  fprintf ( 1, '  complex arithmetic parameters.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ZMACH(1)  = machine epsilon = %e\n', zmach ( 1 ) );
  fprintf ( 1, '  ZMACH(2)  = a tiny value    = %e\n', zmach ( 2 ) );
  fprintf ( 1, '  ZMACH(3)  = a huge value    = %e\n', zmach ( 3 ) );

  return
end
