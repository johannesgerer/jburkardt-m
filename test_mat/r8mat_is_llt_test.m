function r8mat_is_llt_test ( )

%*****************************************************************************80
%
%% R8MAT_IS_LLT_TEST tests R8MAT_IS_LLT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2015
%
%  Author:
%
%    John Burkardt
%
  m = 4;
  n = 4;

  a = [ ...
    2.0, 1.0, 0.0, 0.0; ...
    1.0, 2.0, 1.0, 0.0; ...
    0.0, 1.0, 2.0, 1.0; ...
    0.0, 0.0, 1.0, 2.0 ];

  l = [ ...
    1.414213562373095, 0.0,               0.0,               0.0; ...
    0.707106781186547, 1.224744871391589, 0.0,               0.0; ...
    0.0,               0.816496580927726, 1.154700538379251, 0.0; ...
    0.0,               0.0,               0.866025403784439, 1.118033988749895 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_LLT_TEST:\n' );
  fprintf ( 1, '  R8MAT_IS_LLT tests the error in a lower triangular\n' );
  fprintf ( 1, '  Cholesky factorization A = L * L'' by looking at\n' );
  fprintf ( 1, '    A - L * L''\n' );

  r8mat_print ( m, m, a, '  Matrix A:' );
  r8mat_print ( m, n, l, '  Factor L:' );

  value = r8mat_is_llt ( m, n, a, l );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of A-L*L'' is %g\n', value );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_IS_LLT_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
