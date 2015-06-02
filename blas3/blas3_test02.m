function blas3_test02 ( )

%*****************************************************************************80
%
%% BLAS3_TEST02 tests DTRMM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  DTRMM multiplies a triangular matrix A and a\n' );
  fprintf ( 1, '  rectangular matrix B\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1: B = alpha * A  * B;\n' );
  fprintf ( 1, '  2: B = alpha * A'' * B;\n' );
%
%  B = alpha * A * B.
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

  a = zeros ( m, m );
  for j = 1 : m
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrmm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  B = alpha * A * B:' );
%
%  B = alpha * A' * B.
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

  a = zeros ( m, m );
  for j = 1 : m
    for i = 1 : j
      a(i,j) = i + j;
    end
  end

  transb = 'N';
  b = r8mat_test ( transb, ldb, m, n );

  b = dtrmm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb );

  r8mat_print ( m, n, b, '  B = alpha * A * B:' );

  return
end

