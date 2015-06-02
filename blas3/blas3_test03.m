function blas3_test03 ( )

%*****************************************************************************80
%
%% BLAS3_TEST03 tests DTRSM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS3_TEST03\n' );
  fprintf ( 1, '  DTRSM solves a linear system involving a triangular\n' );
  fprintf ( 1, '  matrix A and a rectangular matrix B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1: Solve A  * X  = alpha * B;\n' );
  fprintf ( 1, '  2: Solve A'' * X  = alpha * B;\n' );
  fprintf ( 1, '  3: Solve X  * A  = alpha * B;\n' );
  fprintf ( 1, '  4: Solve X  * A'' = alpha * B;\n' );
%
%  Solve A * X = alpha * B.
%
  side = 'L';
  uplo = 'U';
  transa = 'N';
  diag = 'N';
  m = 4;
  n = 5;
  alpha = 2.0;
  lda = m;
  ldb = m;

  a = zeros ( lda, m );
  for j = 1 : m
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrsm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  X = inv ( A ) * alpha * B:' );
%
%  Solve A' * X = alpha * B.
%
  side = 'L';
  uplo = 'U';
  transa = 'T';
  diag = 'N';
  m = 4;
  n = 5;
  alpha = 2.0;
  lda = m;
  ldb = m;

  a = zeros ( lda, m );
  for j = 1 : m
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrsm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  X = inv ( A'' ) * alpha * B:' );
%
%  Solve X * A = alpha * B.
%
  side = 'R';
  uplo = 'U';
  transa = 'N';
  diag = 'N';
  m = 4;
  n = 5;
  alpha = 2.0;
  lda = n;
  ldb = m;

  a = zeros ( lda, n );
  for j = 1 : n
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrsm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  X = alpha * B * inv ( A ):' );
%
%  Solve X * A'' = alpha * B.
%
  side = 'R';
  uplo = 'U';
  transa = 'T';
  diag = 'N';
  m = 4;
  n = 5;
  alpha = 2.0;
  lda = n;
  ldb = m;

  a = zeros ( lda, n );
  for j = 1 : n
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrsm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  X = alpha * B * inv ( A'' ):' );

  return
end

