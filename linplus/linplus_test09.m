function linplus_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests R83P_DET.
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
  n = 12;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  R83P_DET, determinant of a tridiagonal\n' );
  fprintf ( 1, '    periodic matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r83p_random ( n, seed );

  r83p_print ( n, a, '  The periodic tridiagonal matrix:' );
%
%  Copy the matrix into a general array.
%
  b = r83p_to_r8ge ( n, a );
%
%  Factor the matrix.
%
  [ a_lu, work2, work3, work4, info ] = r83p_fa ( n, a );
%
%  Compute the determinant.
%
  det = r83p_det ( n, a_lu, work4 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R83P_DET computes the determinant = %14.6e\n', det );
%
%  Factor the general matrix.
%
  [ b_lu, pivot, info ] = r8ge_fa ( n, b );
%
%  Compute the determinant.
%
  det = r8ge_det ( n, b_lu, pivot );

  fprintf ( 1, '  R8GE_DET computes the determinant = %14.6e\n', det );

  return
end
