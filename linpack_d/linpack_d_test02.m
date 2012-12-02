function linpack_d_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests DCHEX.
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
  nz = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  For double precision, general storage,\n' );
  fprintf ( 1, '  DCHEX can shift columns in a Cholesky factorization.\n' );
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

  for i = 1 : n
    z(i,1) = i;
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vector Z:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %14f\n', z(i) );
  end
%
%  Decompose the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Decompose the matrix.\n' );

  job = 0;
  ipvt(1:n) = 0;

  [ a, ipvt, info ] = dchdc ( a, lda, n, ipvt, job );

  if ( info ~= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DCHDC returned INFO = %d\n', info );
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
%  Right circular shift columns L through K.
%
  k = 1;
  l = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Right circular shift columns K  = %d through L = %d\n', k, l );

  job = 1;
  [ a, z, c, s ] = dchex ( a, lda, n, k, l, z, n, nz, job );
%
%  Left circular shift columns K+1 through L.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Left circular shift columns K+1 = %d through L = %d\n', k+1, l );

  job = 2;
  [ a, z, c, s ] = dchex ( a, lda, n, k+1, l, z, n, nz, job );
%
%  Print the factorization.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The shifted Cholesky factor U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The shifted vector Z:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %14f\n', z(i) );
  end
%
%  Compute the Cholesky product.
%
  a(1:n,1:n) = a(1:n,1:n)' * a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The shifted product U'' * U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  %14f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
