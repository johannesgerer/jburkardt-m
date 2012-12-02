function blas1_s_test08 ( )

%*****************************************************************************80
%
%% TEST08 demonstrates SNRM2.
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
  lda = n + 5;
%
%  These parameters illustrate the fact that matrices are typically
%  dimensioned with more space than the user requires.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  SNRM2 computes the Euclidean norm of a vector.\n' );
  fprintf ( 1, '\n' );
%
%  Compute the euclidean norm of a vector:
%
  for i = 1 : n
    x(i) = i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vector X:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end
  incx = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The 2-norm of X is %f\n', snrm2 ( n, x, incx ) );
%
%  Compute the euclidean norm of a row or column of a matrix:
%
  a = zeros ( lda, lda );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = i + j;
    end
  end

  incx = lda;
  sum1 = snrm2 ( n, a(2,1:n), 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The 2-norm of row 2 of A is %f\n', sum1 );

  incx = 1;
  sum1 = snrm2 ( n, a(1:n,2), incx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The 2-norm of column 2 of A is %f\n', sum1 );

  return
end
