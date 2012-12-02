function linpack_z_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests ZCHDC.
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
  n = 3;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  For a complex Hermitian positive definite matrix,\n' );
  fprintf ( 1, '  ZCHDC computes the Cholesky decomposition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of equations is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1,1) = complex ( 2.5281,  0.0000 );
  a(2,1) = complex ( 2.1341,  0.2147 );
  a(3,1) = complex ( 2.4187, -0.2932 );

  a(1,2) = complex ( 2.1341, -0.2147 );
  a(2,2) = complex ( 3.0371,  0.0000 );
  a(3,2) = complex ( 2.0905, -1.1505 );

  a(1,3) = complex ( 2.4187,  0.2932 );
  a(2,3) = complex ( 2.0905,  1.1505 );
  a(3,3) = complex ( 2.7638,  0.0000 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%10f  %10f)', real ( a(i,j) ), imag ( a(i,j) ) );
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

  [ a, ipvt, info ] = zchdc ( a, lda, n, ipvt, job );

  if ( info ~= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZCHDC returned INFO = %d\n', info );
    fprintf ( 1, '  The matrix is not Hermitian positive definite.\n' );
  end
%
%  Zero out the lower diagonal.
%
  for i = 2 : n
    for j = 1 : i-1
      a(i,j) = 0.0;;
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
      fprintf ( 1, '  (%10f  %10f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Compute the Cholesky product.
%
  a(1:n,1:n) = a(1:n,1:n)' * a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product U^H * U:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%10f  %10f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
