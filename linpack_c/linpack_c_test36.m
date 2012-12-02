function linpack_c_test36 ( )

%*****************************************************************************80
%
%% LINPACK_C_TEST36 tests CTRDI.
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
  fprintf ( 1, 'TEST36\n' );
  fprintf ( 1, '  For a single precision complex (C)\n' );
  fprintf ( 1, '  triangular matrix (TR),\n' );
  fprintf ( 1, '  CTRDI computes the determinant or inverse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the matrix.
%
  seed = 123456789;

  for i = 1 : n
    for j = 1 : i
      [ a(i,j), seed ] = c4_uniform_01 ( seed );
    end
    a(i,i+1:n) = 0.0;
  end

  a_save(1:n,1:n) = a(1:n,1:n);
%
%  Get the determinant of the lower triangular matrix.
%
  job = 100;
  [ a, det, info ] = ctrdi ( a, lda, n, job );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant = (%8f  %8f) * 10^(%8f)\n', ...
    real ( det(1) ), imag ( det(1) ), real ( det(2) ) );
%
%  Get the inverse of the lower triangular matrix.
%
  job = 010;
  [ a, det, info ] = ctrdi ( a, lda, n, job );

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
