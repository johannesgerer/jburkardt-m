function linpack_d_test29 ( )

%*****************************************************************************80
%
%% TEST29 tests DTRCO.
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
  fprintf ( 1, 'TEST29\n' );
  fprintf ( 1, '  For a triangular matrix,\n' );
  fprintf ( 1, '  DTRCO computes the LU factors and\n' );
  fprintf ( 1, '  computes its reciprocal condition number.\n' );
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

  job = 0;
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition:\n' );

  [ rcond, z ] = dtrco ( a, lda, n, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reciprocal condition number = %f\n', rcond );
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
%
%  Estimate the condition.
%
  job = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition:\n' );

  [ rcond, z ] = dtrco ( a, lda, n,  job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The reciprocal condition number = %f\n', rcond );

  return
end
