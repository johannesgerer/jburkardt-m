function linpack_d_test30 ( )

%*****************************************************************************80
%
%% TEST30 tests DTRDI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  lda = n;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST30\n' );
  fprintf ( 1, '  For a triangular matrix,\n' );
  fprintf ( 1, '  DTRDI computes the determinant or inverse.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Lower triangular matrix A.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  for i = 1 : n
    for j = i+1 : n
      a(i,j) = 0.0;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower triangular matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  job = 110;

  [ a, det, info ] = dtrdi ( a, lda, n, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The determinant = %f * 10 ^ %f\n ', det(1), det(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The inverse matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

%
%  Upper triangular matrix A.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  for i = 1 : n
    for j = 1 : i - 1
      a(i,j) = 0.0;
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Upper triangular matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  job = 111;

  [ a, det, info ] = dtrdi ( a, lda, n, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The determinant = %f * 10 ^ %f\n ', det(1), det(2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The inverse matrix:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
