function test_plu ( )

%*****************************************************************************80
%
%% TEST_PLU tests the PLU factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_PLU\n' );
  fprintf ( 1, '  A = a test matrix of order M by N\n' );
  fprintf ( 1, '  P, L, U are the PLU factors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ||A|| = Frobenius norm of A.\n' );
  fprintf ( 1, '  ||A-PLU|| = Frobenius norm of A-P*L*U.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    M     N      ' );
  fprintf ( 1, '||A||            ||A-PLU||\n' );
  fprintf ( 1, '\n' );
%
%  A123
%
  title = 'A123';
  m = 3;
  n = 3;
  a = a123 ( );
  [ p, l, u ] = a123_plu ( );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  BODEWIG
%
  title = 'BODEWIG';
  m = 4;
  n = 4;
  a = bodewig ( );
  [ p, l, u ] = bodewig_plu ( );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  BORDERBAND
%
  title = 'BORDERBAND';
  m = 5;
  n = 5;
  a = borderband ( n );
  [ p, l, u ] = borderband_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  DIF2
%
  title = 'DIF2';
  m = 5;
  n = 5;
  a = dif2 ( m, n );
  [ p, l, u ] = dif2_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  GFPP
%
  title = 'GFPP';
  m = 5;
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = gfpp ( n, alpha );
  [ p, l, u ] = gfpp_plu ( n, alpha );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = givens_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  KMS
%
  title = 'KMS';
  m = 5;
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = kms ( alpha, m, n );
  [ p, l, u ] = kms_plu ( alpha, n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  LEHMER
%
  title = 'LEHMER';
  m = 5;
  n = 5;
  a = lehmer ( m, n );
  [ p, l, u ] = lehmer_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MAXIJ
%
  title = 'MAXIJ';
  m = 5;
  n = 5;
  a = maxij ( m, n );
  [ p, l, u ] = maxij_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = minij_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = moler1 ( alpha, n, n );
  [ p, l, u ] = moler1_plu ( alpha, n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = moler3_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = oto_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = pascal2_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  PLU
%
  title = 'PLU';
  n = 5;
  seed = 123456789;
  for i = 1 : n
    i4_lo = i;
    i4_hi = n;
    [ j, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
    pivot(i) = j;
  end
  a = plu ( n, pivot );
  [ p, l, u ] = plu_plu ( n, pivot );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  VAND2
%
  title = 'VAND2';
  m = 4;
  n = 4;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( m, r8_lo, r8_hi, seed );
  a = vand2 ( m, x );
  [ p, l, u ] = vand2_plu ( m, x );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
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
  [ p, l, u ] = wilson_plu ( );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );

  return
end
