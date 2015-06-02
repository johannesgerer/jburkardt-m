function test_llt ( )

%*****************************************************************************80
%
%% TEST_LLT tests LLT factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_LLT\n' );
  fprintf ( 1, '  A = a test matrix of order M by M\n' );
  fprintf ( 1, '  L is an M by N lower triangular Cholesky factor.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ||A|| = Frobenius norm of A.\n' );
  fprintf ( 1, '  ||A-LLT|| = Frobenius norm of A-L*L''.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    M     N      ' );
  fprintf ( 1, '||A||            ||A-LLT||\n' );
  fprintf ( 1, '\n' );
%
%  DIF2
%
  title = 'DIF2';
  m = 5;
  n = 5;
  a = dif2 ( m, n );
  l = dif2_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  GIVENS
%
  title = 'GIVENS';
  m = 5;
  n = 5;
  a = givens ( m, n );
  l = givens_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  KERSHAW
%
  title = 'KERSHAW';
  m = 4;
  n = 4;
  a = kershaw ( );
  l = kershaw_llt ( );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  LEHMER
%
  title = 'LEHMER';
  m = 5;
  n = 5;
  a = lehmer ( n, n );
  l = lehmer_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MINIJ
%
  title = 'MINIJ';
  m = 5;
  n = 5;
  a = minij ( n, n );
  l = minij_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MOLER1
%
  title = 'MOLER1';
  m = 5;
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  alpha = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = moler1 ( alpha, m, n );
  l = moler1_llt ( alpha, n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MOLER3
%
  title = 'MOLER3';
  m = 5;
  n = 5;
  a = moler3 ( m, n );
  l = moler3_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  OTO
%
  title = 'OTO';
  m = 5;
  n = 5;
  a = oto ( m, n );
  l = oto_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  PASCAL2
%
  title = 'PASCAL2';
  m = 5;
  n = 5;
  a = pascal2 ( n );
  l = pascal2_llt ( n );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  WILSON
%
  title = 'WILSON';
  m = 4;
  n = 4;
  a = wilson ( );
  l = wilson_llt ( );
  error_frobenius = r8mat_is_llt ( m, n, a, l );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );

  return
end
