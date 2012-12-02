function linplus_test52 ( )

%*****************************************************************************80
%
%% TEST52 tests R8PO_RANDOM, R8PO_TO_R8GE.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST52\n' );
  fprintf ( 1, '  R8PO_RANDOM computes a random positive definite\n' );
  fprintf ( 1, '    symmetric matrix.\n' );
  fprintf ( 1, '  R8PO_TO_R8GE converts a R8PO matrix to R8GE format.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8po_random ( n, seed );

  r8po_print ( n, a, '  The random R8PO matrix:' );
 
  r8ge_print ( n, n, a, '  The random R8PO matrix (printed by R8GE_PRINT):' );

  b = r8po_to_r8ge ( n, a );

  r8ge_print ( n, n, b, '  The random R8GE matrix (printed by R8GE_PRINT):' );

  return
end
