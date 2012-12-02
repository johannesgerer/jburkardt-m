function linplus_test62 ( )

%*****************************************************************************80
%
%% TEST62 tests R8VM_DET.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST62\n' );
  fprintf ( 1, '  R8VM_DET, determinant of a Vandermonde matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8vm_random ( n, n, seed );

  r8vm_print ( n, n, a, '  The Vandermonde matrix:' );
%
%  Copy the matrix into a general array.
%
  a2 = r8vm_to_r8ge ( n, n, a );
%
%  Compute the determinant.
%
  det = r8vm_det ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8VM_DET computes the determinant = %14.6e\n', det );
%
%  Factor the general matrix.
%
  [ a2_lu, pivot, info ] = r8ge_fa ( n, a2 );
%
%  Compute the determinant.
%
  det = r8ge_det ( n, a2_lu, pivot );

  fprintf ( 1, '  R8GE_DET computes the determinant = %14.6e\n', det );

  return
end
