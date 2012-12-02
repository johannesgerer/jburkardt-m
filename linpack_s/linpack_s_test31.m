function linpack_s_test31 ( )

%*****************************************************************************80
%
%% TEST31 tests STRSL.
%
%  Discussion:
%
%    STRSL solves triangular linear systems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  lda = n;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST31\n' );
  fprintf ( 1, '  For a triangular matrix,\n' );
  fprintf ( 1, '  STRSL solves a linear system.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Lower triangular matrix A.
%
  [ a, seed ] = r4mat_uniform_01 ( n, n, seed );

  for i = 1 : n
    for j = i+1 : n
      a(i,j) = 0.0;
    end
  end
  
  for i = 1 : n
    x(i,1) = i;
  end

  b(1:n,1) = a(1:n,1:n) * x(1:n,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For a lower triangular matrix A,\n' );
  fprintf ( 1, '  solve A * x = b\n' );

  job = 00;

  [ b, info ] = strsl ( a, lda, n, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution (should be 1,2,3,4,5):\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, b(i,1) );
  end
  
  b(1:n,1) = a(1:n,1:n)' * x(1:n,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For a lower triangular matrix A,\n' );
  fprintf ( 1, '  solve A'' * x = b\n' );

  job = 10;

  [ b, info ] = strsl ( a, lda, n, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution (should be 1,2,3,4,5):\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, b(i,1) );
  end
%
%  Upper triangular matrix A.
%
  [ a, seed ] = r4mat_uniform_01 ( n, n, seed );

  for i = 1 : n
    for j = 1 : i - 1
      a(i,j) = 0.0;
    end
  end
  
  for i = 1 : n
    x(i,1) = i;
  end
  
  b(1:n,1) = a(1:n,1:n) * x(1:n,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For an upper triangular matrix A,\n' );
  fprintf ( 1, '  solve A * x = b\n' );

  job = 01;

  [ b, info ] = strsl ( a, lda, n, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution (should be 1,2,3,4,5):\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, b(i,1) );
  end

  b(1:n,1) = a(1:n,1:n)' * x(1:n,1);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  For an upper triangular matrix A,\n' );
  fprintf ( 1, '  solve A'' * x = b\n' );

  job = 11;

  [ b, info ] = strsl ( a, lda, n, b, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The solution (should be 1,2,3,4,5):\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, b(i,1) );
  end

  return
end
