function linplus_test19 ( )

%*****************************************************************************80
%
%% TEST19 tests R8CBB_FA, R8CBB_PRINT, R8CBB_RANDOM, R8CBB_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n1 = 8;
  n2 = 2;
  n = n1 + n2;
  ml = 1;
  mu = 1;
  na = ( ml + mu + 1 ) * n1 + 2 * n1 * n2 + n2 * n2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST19\n' );
  fprintf ( 1, '  For a compressed border banded matrix:\n' );
  fprintf ( 1, '  R8CBB_RANDOM randomly generates;\n' );
  fprintf ( 1, '  R8CBB_PRINT prints;\n' );
  fprintf ( 1, '  R8CBB_FA factors (no pivoting);\n' );
  fprintf ( 1, '  R8CBB_SL solves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Matrix suborder N1 = %d\n', n1 );
  fprintf ( 1, '  Matrix suborder N2 = %d\n', n2 );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8cbb_random ( n1, n2, ml, mu, seed );

  r8cbb_print ( n1, n2, ml, mu, a, '  The R8CBB matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8cbb_mxv ( n1, n2, ml, mu, a, x );
%
%  Factor the matrix
%
  [ a_lu, info ] = r8cbb_fa ( n1, n2, ml, mu, a );

  r8cbb_print ( n1, n2, ml, mu, a_lu, '  The factored matrix:' );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST19 - Fatal error!\n' );
    fprintf ( 1, '  R8CBB_FA claims the matrix is singular.\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the system.
%
  r8vec_print ( n, b, '  The right hand side vector:' );

  x = r8cbb_sl ( n1, n2, ml, mu, a_lu, b );

  r8vec_print ( n, x, '  Solution:' );

  return
end
