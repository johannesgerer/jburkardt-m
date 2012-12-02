function linplus_test47 ( )

%*****************************************************************************80
%
%% TEST47 tests R8PBU_FA, R8PBU_RANDOM, R8PBU_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 50;
  mu = 1;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST47\n' );
  fprintf ( 1, '  For a banded positive definite symmetric matrix,\n' );
  fprintf ( 1, '  R8PBU_FA computes the LU factors.\n' );
  fprintf ( 1, '  R8PBU_RANDOM sets a random value.\n' );
  fprintf ( 1, '  R8PBU_SL solves a linear system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
  fprintf ( 1, '\n' );
%
%  Set the matrix values.
%
  [ a, seed ] = r8pbu_random ( n, mu, seed );
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the right hand side.
%
  b = r8pbu_mxv ( n, mu, a, x );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8pbu_fa ( n, mu, a );
%
%  Solve the linear system.
%
  x = r8pbu_sl ( n, mu, a_lu, b );
 
  r8vec_print_some ( n, x, 1, 10, '  Solution:' );
 
  return
end
