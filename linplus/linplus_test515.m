function linplus_test515 ( )

%*****************************************************************************80
%
%% TEST515 tests R8PO_FA, R8PO_SL, R8PO_ML, R8PO_MXV.
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
  fprintf ( 1, 'TEST515\n' );
  fprintf ( 1, '  For a positive definite symmetric matrix,\n' );
  fprintf ( 1, '  R8PO_FA computes the Cholesky factor.\n' );
  fprintf ( 1, '  R8PO_SL solves a factored linear system.\n' );
  fprintf ( 1, '  R8PO_MXV multiplies unfactored A * x\n' );
  fprintf ( 1, '  R8PO_ML multiplies factored A * x\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8po_random ( n, seed );

  r8po_print ( n, a, '  The matrix A:' );
%
%  Compute the desired right hand side.
%
  x = r8vec_indicator ( n );

  b = r8po_mxv ( n, a, x );

  r8vec_print ( n, b, '  Right hand side, computed by R8PO_MXV' );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8po_fa ( n, a );
%
%  Solve the linear system.
%
  x = r8po_sl ( n, a_lu, b );

  r8vec_print ( n, x, '  Solution (should be 1,2,3...)' );
%
%  Recompute the desired right hand side.
%  Since A has been factored, we have to R8PO_ML now.
%
  x = r8vec_indicator ( n );

  b = r8po_ml ( n, a_lu, x );

  r8vec_print ( n, b, '  Right hand side, computed by R8PO_ML' );
%
%  Solve the linear system.
%
  x = r8po_sl ( n, a_lu, b );

  r8vec_print ( n, x, '  Solution (should be 1,2,3...)' );

  return
end
