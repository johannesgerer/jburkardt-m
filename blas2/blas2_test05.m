function blas2_test05 ( )

%*****************************************************************************80
%
%% BLAS2_TEST05 tests DGER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS2_TEST05\n' );
  fprintf ( 1, '  For a general matrix A,\n' );
  fprintf ( 1, '  DGER computes A := A + alpha * x * y''\n' );

  m = 5;
  n = 4;
  alpha = 2.0;
  trans = 'N';
  lda = m;
  a = r8mat_test ( trans, lda, m, n );

  x = zeros ( m, 1 );
  for i = 1 : m
    x(i) = i;
  end
  incx = 1;

  y = zeros ( n, 1 );
  for i = 1 : n
    y(i) = 10 * i;
  end
  incy = 1;

  r8mat_print ( m, n, a, '  Matrix A:' );
  r8vec_print ( m, x, '  Vector X:' );
  r8vec_print ( n, y, '  Vector Y:' );

  a = dger ( m, n, alpha, x, incx, y, incy, a, lda );

  r8mat_print ( m, n, a, '  Result A = A + alpha * x * y' );

  return
end
