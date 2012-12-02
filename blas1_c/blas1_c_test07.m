function blas1_c_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests CMACH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n');
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  CMACH computes several machine-dependent\n' );
  fprintf ( 1, '  complex arithmetic parameters.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CMACH(1)  = machine epsilon = %e\n', cmach ( 1 ) );
  fprintf ( 1, '  CMACH(2)  = a tiny value    = %e\n', cmach ( 2 ) );
  fprintf ( 1, '  CMACH(3)  = a huge value    = %e\n', cmach ( 3 ) );

  return
end
