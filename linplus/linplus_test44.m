function linplus_test44 ( )

%*****************************************************************************80
%
%% TEST44 tests R8LT_DET, R8LT_INVERSE, R8LT_MXM, R8LT_RANDOM.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST44\n' );
  fprintf ( 1, '  For a matrix in lower triangular storage,\n' );
  fprintf ( 1, '  R8LT_DET computes the determinant.\n' );
  fprintf ( 1, '  R8LT_INVERSE computes the inverse.\n' );
  fprintf ( 1, '  R8LT_MXM computes matrix products.\n' );
  fprintf ( 1, '  R8LT_RANDOM sets a random value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  [ a, seed ] = r8lt_random ( n, n, seed );

  r8lt_print ( n, n, a, '  Matrix A:' );
%
%  Compute the determinant.
%
  det = r8lt_det ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant is %f\n', det );
%
%  Compute the inverse matrix.
%
  a_inverse = r8lt_inverse ( n, a );

  r8lt_print ( n, n, a_inverse, '  Inverse matrix B:' );
%
%  Check
%
  c = r8lt_mxm ( n, a, a_inverse );

  r8lt_print ( n, n, c, '  Product A * B:' );

  return
end
