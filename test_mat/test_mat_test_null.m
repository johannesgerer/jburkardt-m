function test_mat_test_null ( )

%*****************************************************************************80
%
%% TEST_NULL tests the null vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_NULL\n' );
  fprintf ( 1, '  A = a test matrix of order M by N;\n' );
  fprintf ( 1, '  x = an N vector, candidate for a null vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ||A|| = Frobenius norm of A.\n' );
  fprintf ( 1, '  ||x|| = L2 norm of x.\n' );
  fprintf ( 1, '  ||A*x||/||x|| = L2 norm of A*x over L2 norm of x.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix title           M     N      ' );
  fprintf ( 1, '||A||            ||x||        ||A*x||/||x||\n' );
  fprintf ( 1, '\n' );
%
%  ARCHIMEDES matrix.
%
  title = 'ARCHIMEDES';
  m = 7;
  n = 8;
  a = archimedes ( );
  x = archimedes_null ( );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  CHEBY_DIFF1 matrix.
%
  title = 'CHEBY_DIFF1';
  m = 5;
  n = m;
  a = cheby_diff1 ( n );
  x = cheby_diff1_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  CREATION matrix.
%
  title = 'CREATION';
  m = 5;
  n = m;
  a = creation ( m, n );
  x = creation_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  DIF1 matrix.
%  Only has null vectors for N odd.
%
  title = 'DIF1';
  m = 5;
  n = m;
  a = dif1 ( m, n );
  x = dif1_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  DIF1CYCLIC matrix.
%
  title = 'DIF1CYCLIC';
  m = 5;
  n = m;
  a = dif1cyclic ( n );
  x = dif1cyclic_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  DIF2CYCLIC matrix.
%
  title = 'DIF2CYCLIC';
  m = 5;
  n = m;
  a = dif2cyclic ( n );
  x = dif2cyclic_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  EBERLEIN matrix.
%  We have a LEFT null vector.
%
  title = 'EBERLEIN (left)';
  m = 5;
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = eberlein ( alpha, n );
  at = a';
  mt = n;
  nt = m;
  x = eberlein_null_left ( n );
  error_l2 = r8mat_is_null_vector ( mt, nt, at, x );
  norm_a_frobenius = r8mat_norm_fro ( mt, nt, at );
  norm_x_l2 = r8vec_norm_l2 ( nt, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  FIBONACCI1 matrix.
%
  title = 'FIBONACCI1';
  m = 5;
  n = m;
  seed = 123456789;
  [ f1, seed ] = r8_uniform_01 ( seed );
  f1 = round ( 50.0 * f1 - 25.0 ) / 5.0;
  [ f2, seed ] = r8_uniform_01 ( seed );
  f2 = round ( 50.0 * f2 - 25.0 ) / 5.0;
  a = fibonacci1 ( n, f1, f2 );
  x = fibonacci1_null ( n, f1, f2 );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  LAUCHLI matrix.
%  We have a LEFT null vector of a RECTANGULAR matrix.
%
  title = 'LAUCHLI (left)';
  m = 6;
  n = m - 1;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = lauchli ( alpha, m, n );
  at = a';
  mt = n;
  nt = m;
  x = lauchli_null_left ( alpha, m, n );
  error_l2 = r8mat_is_null_vector ( mt, nt, at, x );
  norm_a_frobenius = r8mat_norm_fro ( mt, nt, at );
  norm_x_l2 = r8vec_norm_l2 ( nt, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  LINE_ADJ matrix.
%
  title = 'LINE_ADJ';
  m = 7;
  n = m;
  a = line_adj ( n );
  x = line_adj_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  MOLER2 matrix.
%
  title = 'MOLER2';
  m = 5;
  n = 5;
  a = moler2 ( );
  x = moler2_null ( );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  NEUMANN matrix.
%
  title = 'NEUMANN';
  row_num = 5;
  col_num = 5;
  m = row_num * col_num;
  n = row_num * col_num;
  [ n, a ] = neumann ( row_num, col_num );
  x = neumann_null ( row_num, col_num );;
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  ONE matrix.
%
  title = 'ONE';
  m = 5;
  n = 5;
  a = one ( m, n );
  x = one_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  RING_ADJ matrix.
%  N must be a multiple of 4 for there to be a null vector.
%
  title = 'RING_ADJ';
  m = 12;
  n = 12;
  a = ring_adj ( n );
  x = ring_adj_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  ROSSER1 matrix.
%
  title = 'ROSSER1';
  m = 8;
  n = 8;
  a = rosser1 ( );
  x = rosser1_null ( );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );
%
%  ZERO matrix.
%
  title = 'ZERO';
  m = 5;
  n = 5;
  a = zero ( m, n );
  x = zero_null ( n );
  error_l2 = r8mat_is_null_vector ( m, n, a, x );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  norm_x_l2 = r8vec_norm_l2 ( n, x );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g  %10.2g\n', ...
    title, m, n, norm_a_frobenius, norm_x_l2, error_l2 );

  return
end
