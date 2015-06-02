function blas3_test01 ( )

%****************************************************************************80
%
%  Purpose:
%
%    BLAS3_TEST01 tests DGEMM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS3_TEST01\n' );
  fprintf ( 1, '  DGEMM carries out matrix multiplications\n' );
  fprintf ( 1, '  for double precision real matrices.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1: C = alpha * A  * B  + beta * C;\n' );
  fprintf ( 1, '  2: C = alpha * A'' * B  + beta * C;\n' );
  fprintf ( 1, '  3: C = alpha * A  * B'' + beta * C;\n' );
  fprintf ( 1, '  4: C = alpha * A'' * B'' + beta * C;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We carry out all four calculations, but in each case,\n' );
  fprintf ( 1, '  we choose our input matrices so that we get the same result.\n' );
%
%  C = alpha * A * B + beta * C.
%
  transa = 'N';
  transb = 'N';
  transc = 'N';
  m = 4;
  n = 5;
  k = 3;
  alpha = 2.0;
  lda = m;
  a = r8mat_test ( transa, lda, m, k );
  ldb = k;
  b = r8mat_test ( transb, ldb, k, n );
  beta = 3.0;
  ldc = m;
  c = r8mat_test ( transc, ldc, m, n );
  c = dgemm ( transa, transb, m, n, k, alpha, a, lda, b, ldb, beta, c, ldc );
  r8mat_print ( m, n, c, '  C = alpha * A * B + beta * C:' );
%
%  C = alpha * A' * B + beta * C.
%
  transa = 'T';
  transb = 'N';
  transc = 'N';
  m = 4;
  n = 5;
  k = 3;
  alpha = 2.0;
  lda = k;
  a = r8mat_test ( transa, lda, m, k );
  ldb = k;
  b = r8mat_test ( transb, ldb, k, n );
  beta = 3.0;
  ldc = m;
  c = r8mat_test ( transc, ldc, m, n );

  c = dgemm ( transa, transb,  m, n, k, alpha, a, lda, b, ldb, beta, c, ldc );

  r8mat_print ( m, n, c, '  C = alpha * A'' * B + beta * C:' );
%
%  C = alpha * A * B' + beta * C.
%
  transa = 'N';
  transb = 'T';
  transc = 'N';
  m = 4;
  n = 5;
  k = 3;
  alpha = 2.0;
  lda = m;
  a = r8mat_test ( transa, lda, m, k );
  ldb = n;
  b = r8mat_test ( transb, ldb, k, n );
  beta = 3.0;
  ldc = m;
  c = r8mat_test ( transc, ldc, m, n );

  c = dgemm ( transa, transb, m, n, k, alpha, a, lda, b, ldb, beta, c, ldc );

  r8mat_print ( m, n, c, '  C = alpha * A * B'' + beta * C:' );
%
%  C = alpha * A' * B' + beta * C.
%
  transa = 'T';
  transb = 'T';
  transc = 'N';
  m = 4;
  n = 5;
  k = 3;
  alpha = 2.0;
  lda = k;
  a = r8mat_test ( transa, lda, m, k );
  ldb = n;
  b = r8mat_test ( transb, ldb, k, n );
  beta = 3.0;
  ldc = m;
  c = r8mat_test ( transc, ldc, m, n );

  c = dgemm ( transa, transb,  m, n, k, alpha, a, lda, b, ldb, beta, c, ldc );

  r8mat_print ( m, n, c, '  C = alpha * A'' * B'' + beta * C:' );

  return
end