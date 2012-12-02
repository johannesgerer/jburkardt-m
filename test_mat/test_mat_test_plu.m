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
%    28 June 2011
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
  fprintf ( 1, '  Matrix title	           M     N      ' );
  fprintf ( 1, '||A||            ||A-PLU||\n' );
  fprintf ( 1, '\n' );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  m = 4;
  n = 4;
  a = bodewig ( );
  [ p, l, u ] = bodewig_plu ( );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  BORDERBAND matrix.
%
  title = 'BORDERBAND';
  m = 5;
  n = 5;
  a = borderband ( n );
  [ p, l, u ] = borderband_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  DIF2 matrix.
%
  title = 'DIF2';
  m = 5;
  n = 5;
  a = dif2 ( m, n );
  [ p, l, u ] = dif2_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  GFPP matrix.
%
  title = 'GFPP';
  m = 5;
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = gfpp ( n, alpha );
  [ p, l, u ] = gfpp_plu ( n, alpha );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  GIVENS matrix.
%
  title = 'GIVENS';
  m = 5;
  n = 5;
  a = givens ( m, n );
  [ p, l, u ] = givens_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  KMS matrix.
%
  title = 'KMS';
  m = 5;
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = kms ( alpha, m, n );
  [ p, l, u ] = kms_plu ( alpha, n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MAXIJ matrix.
%
  title = 'MAXIJ';
  m = 5;
  n = 5;
  a = maxij ( m, n );
  [ p, l, u ] = maxij_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MINIJ matrix.
%
  title = 'MINIJ';
  m = 5;
  n = 5;
  a = minij ( n, n );
  [ p, l, u ] = minij_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MOLER1 matrix.
%
  title = 'MOLER1';
  m = 5;
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = moler1 ( alpha, n, n );
  [ p, l, u ] = moler1_plu ( alpha, n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  MOLER3 matrix.
%
  title = 'MOLER3';
  m = 5;
  n = 5;
  a = moler3 ( m, n );
  [ p, l, u ] = moler3_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  OTO matrix.
%
  title = 'OTO';
  m = 5;
  n = 5;
  a = oto ( m, n );
  [ p, l, u ] = oto_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  PASCAL2 matrix.
%
  title = 'PASCAL2';
  m = 5;
  n = 5;
  a = pascal2 ( n );
  [ p, l, u ] = pascal2_plu ( n );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );
%
%  WILSON matrix.
%
  title = 'WILSON';
  m = 4;
  n = 4;
  a = wilson ( );
  [ p, l, u ] = wilson_plu ( );
  error_frobenius = r8mat_is_plu ( m, n, a, p, l, u );
  norm_a_frobenius = r8mat_norm_fro ( m, n, a );
  fprintf ( 1, '  %20s  %4d  %4d  %14g  %14g\n', ...
    title, m, n, norm_a_frobenius, error_frobenius );

  return
end
