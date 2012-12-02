function linpack_z_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests ZGEFA and ZGEDI.
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
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  For a complex general storage matrix:\n' );
  fprintf ( 1, '  ZGEFA factors the matrix.\n' );
  fprintf ( 1, '  ZGEDI computes the determinant or inverse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  [ a, seed ] = c8mat_uniform_01 ( n, n, seed );

  a_save(1:n,1:n) = a(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix:\n' );
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
  [ a, ipvt, info ] = zgefa ( a, lda, n );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZGEFA returned an error flag INFO = %d\n', info );
    return
  end
%
%  Get the determinant.
%
  job = 10;
  [ a, det ] = zgedi ( a, lda, n, ipvt, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = (%f  %f) * 10^%f\n', ...
    real ( det(1) ), imag ( det(1) ), real ( det(2) ) );
%
%  Get the inverse.
%
  job = 01;
  a = zgedi ( a, lda, n, ipvt, job );

  c(1:n,1:n) = a(1:n,1:n) * a_save(1:n,1:n);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The product inv(A) * A is \n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    for j = 1 : n
      fprintf ( 1, '  (%8f  %8f)', real ( c(i,j) ), imag ( c(i,j) ) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
