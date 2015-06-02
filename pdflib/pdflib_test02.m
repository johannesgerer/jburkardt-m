function pdflib_test02 ( )

%*****************************************************************************80
%
%% PDFLIB_TEST02 tests R8VEC_MULTINORMAL_PDF.
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
  fprintf ( 1, 'PDFLIB_TEST02\n' );
  fprintf ( 1, '  R8VEC_MULTINORMAL_PDF evaluates the PDF for the\n' );
  fprintf ( 1, '  multinormal distribution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The covariance matrix is C.\n' );
  fprintf ( 1, '  The definition uses the inverse of C;\n' );
  fprintf ( 1, '  R8VEC_MULTINORMAL_PDF uses the Cholesky factor.\n' );
  fprintf ( 1, '  Verify that the algorithms are equivalent.\n' );
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
%  Compute a positive definite symmetric covariance matrix C.
%
  c = r1' * r1;

  r8mat_print ( n, n, c, '  C:' );
%
%  Compute the Cholesky factor R.
%
  r2 = r8mat_pofac ( n, c );

  r8mat_print ( n, n, r2, '  R2:' );
%
%  Compute the determinant of C.
%
  c_det = r8mat_podet ( n, r2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Determinant of C = %g\n', c_det );
%
%  Compute the inverse of C.
%
  c_inv = r8mat_poinv ( n, r2 );
  r8mat_print ( n, n, c_inv, '  C_INV:' );
%
%  Compute a random set of means.
%
  mu = zeros ( n, 1 );
  for i = 1 : n
    mu(i) = r8_normal_01_sample ( );
  end
%
%  Compute X as small variations from MU.
%
  x = zeros ( n, 1 );
  for i = 1 : n
    eps = 0.01 * r8_normal_01_sample ( );
    x(i) = ( 1.0 + eps ) * mu(i);
  end
%
%  Compute PDF1 from the function.
%
  pdf1 = r8vec_multinormal_pdf ( n, mu, r2, c_det, x );
%
%  Compute PDF2 from the definition.
%
  y(1:n,1) = x(1:n,1) - mu(1:n,1);

  xcx = y' * c_inv * y;

  pdf2 = 1.0 / sqrt ( ( 2.0 * pi ) ^ n ) ...
    * 1.0 / sqrt ( c_det ) ...
    * exp ( - 0.5 * xcx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF1 = %g\n', pdf1 );
  fprintf ( 1, '  PDF2 = %g\n', pdf2 );

  return
end
