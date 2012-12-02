function bernstein_test05 ( )

%*****************************************************************************80
%
%% BERNSTEIN_TEST05 tests BERNSTEIN_MATRIX and BERNSTEIN_MATRIX_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_TEST05\n' );
  fprintf ( 1, '  BERNSTEIN_MATRIX returns a matrix A which transforms a\n' );
  fprintf ( 1, '  polynomial coefficient vector from the power basis to\n' );
  fprintf ( 1, '  the Bernstein basis.\n' );
  fprintf ( 1, '  BERNSTEIN_MATRIX_INVERSE computes the inverse B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    N     ||A||            ||B||      ||I-A*B||\n' );
  fprintf ( 1, '\n' );

  for n = 5 : 15

    a = bernstein_matrix ( n );
    a_norm_frobenius = r8mat_norm_fro ( n, n, a );

    b = bernstein_matrix_inverse ( n );
    b_norm_frobenius = r8mat_norm_fro ( n, n, b );

    c = a * b;
    error_norm_frobenius = r8mat_is_identity ( n, c );

    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', ...
      n, a_norm_frobenius, b_norm_frobenius, error_norm_frobenius );

  end

  return
end

