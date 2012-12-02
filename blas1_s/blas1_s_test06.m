function blas1_s_test06 ( )

%*****************************************************************************80
%
%% TEST06 demonstrates SDOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  lda = 10;
  ldb = 7;
  ldc = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  SDOT computes the dot product of vectors.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    x(i) = i;
  end

  for i = 1 : n
    y(i) = -i;
  end

  for i = 1 : n
    for j = 1 : n
      a(i,j) = i + j;
    end
  end

  for i = 1 : n
    for j = 1 : n
      b(i,j) = i - j;
    end
  end
%
%  To compute a simple dot product of two vectors, use a
%  call like this:
%
  sum1 = sdot ( n, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dot product of X and Y is %f\n', sum1 );
%
%  To multiply a ROW of a matrix A times a vector X:
%
  sum1 = sdot ( n, a(2,1:n), 1, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Product of row 2 of A and X is %f\n', sum1 );
%
%  Product of a column of A and a vector:
%
  sum1 = sdot ( n, a(1:n,2), 1, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Product of column 2 of A and X is %f\n', sum1 );
%
%  Here's how matrix multiplication, c = a*b, could be done:
%
  for i = 1 : n
    for j = 1 : n
      c(i,j) = sdot ( n, a(i,1:n), 1, b(1:n,j), 1 );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix product computed with SDOT:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %12f', c(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
