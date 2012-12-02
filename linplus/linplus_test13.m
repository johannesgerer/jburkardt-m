function linplus_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests R8BB_FA, R8BB_PRINT, R8BB_RANDOM, R8BB_SL.
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
  na = ( 2 * ml + mu + 1 ) * n1 + 2 * n1 * n2 + n2 * n2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  For a border banded matrix:\n' );
  fprintf ( 1, '  R8BB_FA factors;\n' );
  fprintf ( 1, '  R8BB_PRINT prints;\n' );
  fprintf ( 1, '  R8BB_RANDOM randomizes;\n' );
  fprintf ( 1, '  R8BB_SL solves.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = %d\n', n );
  fprintf ( 1, '  Matrix suborder N1 = %d\n', n1 );
  fprintf ( 1, '  Matrix suborder N2 = %d\n', n2 );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8bb_random ( n1, n2, ml, mu, seed );

  r8bb_print ( n1, n2, ml, mu, a, '  The border-banded matrix:' );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n1+n2 );
%
%  Compute the corresponding right hand side.
%
  b = r8bb_mxv ( n1, n2, ml, mu, a, x );

  r8vec_print ( n1+n2, b, '  The right hand side vector:' );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8bb_fa ( n1, n2, ml, mu, a );

  r8bb_print ( n1, n2, ml, mu, a_lu, '  The FACTORED border-banded matrix:' );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST13 - Fatal error!\n' );
    fprintf ( 1, ' R8BB_FA claims the matrix is singular.\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the system.
%
  x = r8bb_sl ( n1, n2, ml, mu, a_lu, pivot, b );

  r8vec_print ( n, x, '  Solution:' );

  return
end
