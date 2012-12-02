function linplus_test60 ( )

%*****************************************************************************80
%
%% TEST60 tests R8UT_DET, R8UT_INVERSE, R8UT_MXM, R8UT_RANDOM.
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
  fprintf ( 1, 'TEST60\n' );
  fprintf ( 1, '  For an upper triangular matrix,\n' );
  fprintf ( 1, '  R8UT_DET computes the determinant.\n' );
  fprintf ( 1, '  R8UT_INVERSE computes the inverse.\n' );
  fprintf ( 1, '  R8UT_MXM computes matrix products.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  [ a, seed ] = r8ut_random ( n, n, seed );

  r8ut_print ( n, n, a, '  The matrix A:' );
%
%  Compute the determinant.
%
  det = r8ut_det ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant is %f\n', det );
%
%  Compute the inverse matrix B.
%
  b = r8ut_inverse ( n, a );

  r8ut_print ( n, n, b, '  The inverse matrix B:' );
%
%  Check
%
  c = r8ut_mxm ( n, a, b );

  r8ut_print ( n, n, c, '  The product A * B:' );

  return
end
