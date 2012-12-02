function linplus_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests R8GB_DET.
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
  m = 10;
  n = m;
  ml = 3;
  mu = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_DET computes the determinant.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML  = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU  = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );

  r8gb_print ( m, n, ml, mu, a, '  A random R8GB matrix:' );
%
%  Copy the matrix into a general array.
%
  a2 = r8gb_to_r8ge ( m, n, ml, mu, a );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8gb_fa ( n, ml, mu, a );
%
%  Compute the determinant.
%
  det = r8gb_det ( n, ml, mu, a_lu, pivot );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8GB_DET computes the determinant = %f\n', det );
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
