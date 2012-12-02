function linpack_s_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests SCHDC.
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
  n = 4;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  For single precision, general storage,\n' );
  fprintf ( 1, '  SCHDC computes the Cholesky decomposition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of equations is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1:n,1:n) = 0.0;

  for i = 1 : n
    a(i,i) = 2.0;
  end

  for i = 1 : n-1
    a(i,i+1) = -1.0;
  end

  for i = 2 : n
    a(i-1,i) = -1.0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Decompose the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Decompose the matrix.\n' );

  job = 0;
  ipvt(1:n) = 0;

  [ a, ipvt, info ] = schdc ( a, lda, n, ipvt, job );

  if ( info ~= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SCHDC returned INFO = %d\n', info );
    fprintf ( 1, '  This means the matrix is not positive definite.\n' );
  end
%
%  Zero out the lower diagonal.
%
  for i = 2 : n
    for j = 1 : i-1
      a(i,j) = 0.0;
    end
  end
%
%  Print the factorization.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Cholesky factor U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Compute the Cholesky product.
%
  a(1:n,1:n) = a(1:n,1:n)' * a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product U'' * U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
