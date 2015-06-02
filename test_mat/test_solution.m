function test_solution ( )

%*****************************************************************************80
%
%% TEST_SOLUTION tests the linear solution computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_SOLUTION\n' );
  fprintf ( 1, '  Compute the Frobenius norm of the solution error:\n' );
  fprintf ( 1, '    A * X - B\n' );
  fprintf ( 1, ...
    '  given MxN matrix A, NxK solution X, MxK right hand side B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    M     N     K       ||A||' );
  fprintf ( 1, '            ||A*X-B||\n' );
  fprintf ( 1, '\n' );
%
%  A123 matrix.
%
  title = 'A123';
  m = 3;
  n = 3;
  k = 1;
  a = a123 ( );
  b = a123_rhs ( );
  x = a123_solution ( );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  m = 4;
  n = 4;
  k = 1;
  a = bodewig ( );
  b = bodewig_rhs ( );
  x = bodewig_solution ( );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  DIF2 matrix.
%
  title = 'DIF2';
  m = 10;
  n = 10;
  k = 2;
  a = dif2 ( m, n );
  b = dif2_rhs ( m, k );
  x = dif2_solution ( n, k );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  FRANK matrix.
%
  title = 'FRANK';
  m = 10;
  n = 10;
  k = 2;
  a = frank ( n );
  b = frank_rhs ( m, k );
  x = frank_solution ( n, k );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  POISSON matrix.
%
  title = 'POISSON';
  nrow = 4;
  ncol = 5;
  m = nrow * ncol;
  n = nrow * ncol;
  k = 1;
  a = poisson ( nrow, ncol );
  b = poisson_rhs ( nrow, ncol, k );
  x = poisson_solution ( nrow, ncol, k );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  WILK03 matrix.
%
  title = 'WILK03';
  m = 3;
  n = 3;
  k = 1;
  a = wilk03 ( );
  b = wilk03_rhs ( );
  x = wilk03_solution ( );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  WILK04 matrix.
%
  title = 'WILK04';
  m = 4;
  n = 4;
  k = 1;
  a = wilk04 ( );
  b = wilk04_rhs ( );
  x = wilk04_solution ( );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );
%
%  WILSON matrix.
%
  title = 'WILSON';
  m = 4;
  n = 4;
  k = 1;
  a = wilson ( );
  b = wilson_rhs ( );
  x = wilson_solution ( );
  error_frobenius = r8mat_is_solution ( m, n, k, a, x, b );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %4d  %14f  %14f\n', ...
    title, m, n, k, norm_frobenius, error_frobenius );

  return
end
