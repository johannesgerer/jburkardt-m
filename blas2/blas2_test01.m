function blas2_test01 ( )

%*****************************************************************************80
%
%% BLAS2_TEST01 tests DGEMV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS2_TEST01\n' );
  fprintf ( 1, '  For a general matrix A,\n' );
  fprintf ( 1, '  DGEMV computes y := alpha * A * x + beta * y\n' );
  fprintf ( 1, '  or             y := alpha * A'' * x + beta * y.\n' );
%
%  y = alpha * A * x + beta * y
%
  trans = 'N';
  m = 5;
  n = 4;
  alpha = 2.0;
  lda = m;
  a = r8mat_test ( trans, lda, m, n );
  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = i;
  end
  incx = 1;
  beta = 3.0;
  y = zeros ( m, 1 );
  for i = 1 : m
    y(i) = 10 * i;
  end
  incy = 1;

  r8mat_print ( m, n, a, '  Matrix A:' );
  r8vec_print ( n, x, '  Vector X:' );
  r8vec_print ( m, y, '  Vector Y:' );

  y = dgemv ( trans, m, n, alpha, a, lda, x, incx, beta, y, incy );

  r8vec_print ( m, y, '  Result Y = alpha * A  * x + beta * y' );
%
%  y = alpha * A' * x + beta * y
%
  trans = 'T';
  m = 5;
  n = 4;
  alpha = 2.0;
  lda = m;
  a = r8mat_test ( trans, lda, n, m );
  x = zeros ( m, 1 );
  for i = 1 : m
    x(i) = i;
  end
  incx = 1;
  beta = 3.0;
  y = zeros ( n, 1 );
  for i = 1 : n
    y(i) = 10 * i;
  end
  incy = 1;

  r8mat_print ( m, n, a, '  Matrix A:' );
  r8vec_print ( m, x, '  Vector X:' );
  r8vec_print ( n, y, '  Vector Y:' );

  y = dgemv ( trans, m, n, alpha, a, lda, x, incx, beta, y, incy );

  r8vec_print ( n, y, '  Result Y = alpha * A'' * x + beta * y' );

  return
end