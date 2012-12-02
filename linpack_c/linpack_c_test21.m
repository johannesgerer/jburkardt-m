function linpack_c_test21 ( )

%*****************************************************************************80
%
%% TEST21 tests CPOFA and CPODI.
%
%  Discussion:
%
%    CPOFA factors a positive definite symmetric matrix,
%    and CPODI can compute the determinant or the inverse.
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
  fprintf ( 1, 'TEST21\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite matrix (PO),\n' );
  fprintf ( 1, '  CPOFA computes the LU factors,\n' );
  fprintf ( 1, '  CPODI computes the inverse or determinant.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
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

  a_save(1:n,1:n) = a(1:n,1:n);
%
%  Factor the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Factor the matrix.\n' );

  [ a, info ] = cpofa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Error, CPOFA returns INFO = %d\n', info );
    return
  end
%
%  Get the determinant and inverse.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Get the determinant and inverse.\n' );
 
  job = 11;
  [ a, det ] = cpodi ( a, lda, n, job );
%
%  Print the results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant  = %f * 10^(%f)\n', det(1), det(2) );
%
%  CPODI produces only the 'upper half triangle' of the inverse,
%  which is actually symmetric.  Thus, the lower half could be
%  produced by copying from the upper half.  
%
  for i = 1 : n
    a(i,1:i-1) = conj ( a(1:i-1,i) );
  end

  b(1:n,1:n) = a(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product inverse(A) * A:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( b(1,j) ), imag ( b(1,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
