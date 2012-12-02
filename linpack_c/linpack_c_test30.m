function linpack_c_test30 ( )

%*****************************************************************************80
%
%% TEST30 tests CSIFA and CSIDI.
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
  fprintf ( 1, 'TEST30\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  symmetric matrix (SI):\n' );
  fprintf ( 1, '  CSIFA factors the matrix.\n' );
  fprintf ( 1, '  CSIDI computes the determinant or inverse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  for i = 1 : n
    [ a(i,i), seed ] = c4_uniform_01 ( seed );
    for j = i+1 : n
     [ a(i,j), seed ] = c4_uniform_01 ( seed );
      a(j,i) = a(i,j);
    end
  end

  a_save(1:n,1:n) = a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix A is\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( a(i,j) ), imag ( a(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Factor the matrix A.
%
  [ a, ipvt, info ] = csifa ( a, lda, n );
 
  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  CSIFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Get the determinant.
%
  job = 10;
  [ a, det ] = csidi ( a, lda, n, ipvt, job );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = (%8f  %8f) * 10^(%8f)\n', ...
    real ( det(1) ), imag ( det(1) ), real ( det(2) ) );
%
%  Get the inverse.
%
  job = 01;
  [ a, det ] = csidi ( a, lda, n, ipvt, job );
%
%  Only the upper triangle is set, so the user must set up the
%  lower triangle:
%
  for i = 1 : n
    a(i,1:i-1) = transpose ( a(1:i-1,i) );
  end
 
  c(1:n,1:n) = a(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product inv(A) * A is\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( c(i,j) ), imag ( c(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
