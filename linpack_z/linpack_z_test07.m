function linpack_z_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests ZGECO.
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
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  For a complex general storage matrix:\n' );
  fprintf ( 1, '  ZGECO factors the matrix and estimates the\n' );
  fprintf ( 1, '  reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  seed = 123456789;

  [ a, seed ] = c8mat_uniform_01 ( n, n, seed );

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
  [ a, ipvt, rcond ] = zgeco ( a, lda, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated reciprocal condition RCOND = %f\n', rcond );

  return
end
