function linplus_test46 ( )

%*****************************************************************************80
%
%% TEST46 tests R8PBU_DET.
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
  n = 10;
  mu = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST46\n' );
  fprintf ( 1, '  R8PBU_DET, determinant of a positive definite\n' );
  fprintf ( 1, '    symmetric banded matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8pbu_random ( n, mu, seed );

  r8pbu_print ( n, mu, a, '  The R8PBU matrix:' );
%
%  Copy the matrix into a general array.
%
  a2 = r8pbu_to_r8ge ( n, mu, a );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8pbu_fa ( n, mu, a );

  r8pbu_print ( n, mu, a_lu, '  The R8PBU factored matrix:' );
%
%  Compute the determinant.
%
  a_det = r8pbu_det ( n, mu, a_lu );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8PBU_DET computes the determinant = %f\n', a_det );
%
%  Factor the general matrix.
%
  [ a2_lu, pivot, info ] = r8ge_fa ( n, a2 );
%
%  Compute the determinant.
%
  a2_det = r8ge_det ( n, a2_lu, pivot );

  fprintf ( 1, '  R8GE_DET computes the determinant =  %f\n', a2_det );

  return
end
