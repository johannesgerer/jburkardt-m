function pdflib_test01 ( )

%*****************************************************************************80
%
%% PDFLIB_TEST01 tests R8MAT_POFAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PDFLIB_TEST01\n' );
  fprintf ( 1, '  R8MAT_POFAC computes the Cholesky factor R of a\n' );
  fprintf ( 1, '  positive definite matrix A, so that A = R'' * R.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Start with random R1;\n' );
  fprintf ( 1, '  Compute A = R1'' * R1.\n' );
  fprintf ( 1, '  Call R8MAT_POFAC and see if you recover R2 = R1.\n' );
%
%  Generate a random upper triangular matrix with positive diagonal.
%
  r1 = zeros ( n, n );

  for j = 1 : n
    for i = 1 : j
       r1(i,j) = r8_uniform_01_sample ( );
    end
  end

  r8mat_print ( n, n, r1, '  R1:' );
%
%  Compute a positive definite symmetric matrix A.
%
  a = r1' * r1;

  r8mat_print ( n, n, a, '  A:' );

  r2 = r8mat_pofac ( n, a );

  diff = r8mat_norm_fro_affine ( n, n, r1, r2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius difference between R1 and R2 = %g\n', diff );

  return
end