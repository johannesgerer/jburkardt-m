function linpack_z_test24 ( )

%*****************************************************************************80
%
%% TEST24 tests ZPPFA and ZPPDI.
%
%  Discussion:
%
%    ZPPFA factors a Hermitian positive definite packed matrix,
%    and ZPPDI can compute the determinant or the inverse.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST24\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite packed matrix (PP),\n' );
  fprintf ( 1, '  ZPPFA factors the matrix.\n' );
  fprintf ( 1, '  ZPPDI computes the inverse or determinant.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1) = complex ( 2.5281,  0.0000 );

  a(2) = complex ( 2.1341, -0.2147 );
  a(3) = complex ( 3.0371,  0.0000 );

  a(4) = complex ( 2.4187,  0.2932 );
  a(5) = complex ( 2.0905,  1.1505 );
  a(6) = complex ( 2.7638,  0.0000 );

  a_save(1,1) = a(1);

  a_save(1,2) = a(2);
  a_save(2,1) = conj ( a(2) );
  a_save(2,2) = a(3);

  a_save(1,3) = a(4);
  a_save(3,1) = conj ( a(4) );
  a_save(2,3) = a(5);
  a_save(3,2) = conj ( a(5) );
  a_save(3,3) = a(6);
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = zppfa ( a, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, ZPPFA returns INFO = %d\n', info );
    return
  end
%
%  Invert the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get the determinant and inverse.\n' );

  job = 11;
  [ a, det ] = zppdi ( a, n, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant  = %f * 10^(%f)', det(1), det(2) );
%
%  ZPPDI produces only the 'upper half triangle' of the inverse,
%  which is actually symmetric.  Thus, the lower half could be
%  produced by copying from the upper half.
%
  k = 0;
  for j = 1 : n
    for i = 1 : j
      k = k + 1;
      b(i,j) = a(k);
      b(j,i) = conj ( a(k) );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix Inverse(A):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( b(i,j) ), imag ( b(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  c(1:n,1:n) = b(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix Inverse(A) * A:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( c(i,j) ), imag ( c(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
