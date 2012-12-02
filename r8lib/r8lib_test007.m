function r8lib_test007 ( )

%*****************************************************************************80
%
%% TEST007 tests R8_EPSILON and R8_EPSILON_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  R8_EPSILON produces the R8 roundoff unit.\n' );
  fprintf ( 1, '  R8_EPSILON_COMPUTE computes the R8 roundoff unit.\n' );
  fprintf ( 1, '\n' );

  r1 = r8_epsilon ( );
  fprintf ( 1, '  R1 = R8_EPSILON()         = %e\n', r1 );
  r2 = r8_epsilon_compute ( );
  fprintf ( 1, '  R2 = R8_EPSILON_COMPUTE() = %e\n', r2 );

  s = ( 1.0 + r2 ) - 1.0;
  fprintf ( 1, '  ( 1 + R2 ) - 1            = %e\n', s );

  s = ( 1.0 + ( r2 / 2.0 ) ) - 1.0;
  fprintf ( 1, '  ( 1 + (R2/2) ) - 1        = %e\n', s );

  return
end
