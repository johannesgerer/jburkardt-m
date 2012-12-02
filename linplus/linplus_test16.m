function linplus_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests R8CB_NP_FA, R8CB_DET.
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
  n = 10;
  ml = 2;
  mu = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  For a compact band matrix, no pivoting:\n' );
  fprintf ( 1, '  R8CB_NP_FA factors;\n' );
  fprintf ( 1, '  R8CB_DET computes the determinant;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N     = ', n );
  fprintf ( 1, '  Lower bandwidth ML = ', ml );
  fprintf ( 1, '  Upper bandwidth MU = ', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8cb_random ( n, ml, mu, seed );

  r8cb_print ( n, n, ml, mu, a, '  The compact band matrix:' );
%
%  Copy the matrix into a general array.
%
  a2 = r8cb_to_r8ge ( n, ml, mu, a );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8cb_np_fa ( n, ml, mu, a );
%
%  Compute the determinant.
%
  det = r8cb_det ( n, ml, mu, a_lu );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8CB_DET computes the determinant = %f\n', det );
%
%  Factor the general matrix.
%
  [ a2_lu, pivot, info ] = r8ge_fa ( n, a2 );
%
%  Compute the determinant.
%
  det = r8ge_det ( n, a2_lu, pivot );

  fprintf ( 1, '  R8GE_DET computes the determinant = %f\n', det );

  return
end
