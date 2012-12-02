function linplus_test51 ( )

%*****************************************************************************80
%
%% TEST51 tests R8PO_DET, R8PO_INVERSE.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST51\n' );
  fprintf ( 1, '  For a symmetric positive definite matrix\n' );
  fprintf ( 1, '    factored by R8PO_FA,\n' );
  fprintf ( 1, '  R8PO_DET computes the determinant;\n' );
  fprintf ( 1, '  R8PO_INVERSE computes the inverse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = min ( i, j );
    end
  end

  r8po_print ( n, a, '  Matrix A:' )
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8po_fa ( n, a );
%
%  Compute the determinant.
%
  det = r8po_det ( n, a_lu );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix determinant = %f\n', det );
%
%  Compute the inverse.
%
  b = r8po_inverse ( n, a_lu );

  r8po_print ( n, b, '  Inverse matrix B:' );
%
%  Check.
%
  c = r8po_mxm ( n, a, b );

  r8po_print ( n, c, '  Product A * B:' );

  return
end
