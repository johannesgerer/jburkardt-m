function test_inverse ( )

%*****************************************************************************80
%
%% TEST_INVERSE tests the inverse computations.
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
  fprintf ( 1, 'TEST_INVERSE\n' );
  fprintf ( 1, '  A = a test matrix of order N;\n' );
  fprintf ( 1, '  B = inverse as computed by a routine.\n' );
  fprintf ( 1, '  C = inverse as computed by Matlab''s INV function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ||A||    = Frobenius norm of A.\n' );
  fprintf ( 1, '  ||C||    = Frobenius norm of C.\n' );
  fprintf ( 1, '  ||I-AC|| = Frobenius norm of I-A*C.\n' );
  fprintf ( 1, '  ||I-AB|| = Frobenius norm of I-A*B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix title           N      ' );
  fprintf ( 1, '||A||      ||C||      ||I-AC||        ||I-AB||\n' );
  fprintf ( 1, '\n' );
%
%  AEGERTER matrix.
%
  title = 'AEGERTER';
  n = 5;
  a = aegerter ( n );
  b = aegerter_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BAB matrix.
%
  title = 'BAB';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta - 25.0 ) / 5.0;
  a = bab ( n, alpha, beta );
  b = bab_inverse ( n, alpha, beta );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BERNSTEIN matrix.
%
  title = 'BERNSTEIN';
  n = 5;
  a = bernstein ( n );
  b = bernstein_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BIS matrix.
%
  title = 'BIS';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = bis ( alpha, beta, n, n );
  b = bis_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  n = 4;
  a = bodewig ( );
  b = bodewig_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BOOTHROYD matrix.
%
  title = 'BOOTHROYD';
  n = 5;
  a = boothroyd ( n );
  b = boothroyd_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BORDERBAND matrix.
%
  title = 'BORDERBAND';
  n = 5;
  a = borderband ( n );
  b = borderband_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CARRY matrix.
%
  title = 'CARRY';
  n = 5;
  seed = 123456789;
  [ k, seed ] = i4_uniform ( 2, 20, seed );
  a = carry ( k, n );
  b = carry_inverse ( k, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CAUCHY matrix.
%
  title = 'CAUCHY';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  [ y, seed ] = r8vec_uniform_01 ( n, seed );
  a = cauchy ( n, x, y );
  b = cauchy_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_T matrix.
%
  title = 'CHEBY_T';
  n = 5;
  a = cheby_t ( n );
  b = cheby_t_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_U matrix.
%
  title = 'CHEBY_U';
  n = 5;
  a = cheby_u ( n );
  b = cheby_u_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 5;
  a = cheby_van2 ( n );
  b = cheby_van2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_VAN3 matrix.
%
  title = 'CHEBY_VAN3';
  n = 5;
  a = cheby_van3 ( n );
  b = cheby_van3_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHOW matrix.
%
  title = 'CHOW';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = chow ( alpha, beta, n, n );
  b = chow_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CIRCULANT matrix.
%
  title = 'CIRCULANT';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = circulant ( n, n, x );
  b = circulant_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CIRCULANT2 matrix.
%
  title = 'CIRCULANT2';
  n = 5;
  a = circulant2 ( n );
  b = circulant2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT1 matrix.
%
  title = 'CLEMENT1';
  n = 6;
  a = clement1 ( n );
  b = clement1_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT2 matrix.
%
  title = 'CLEMENT2';
  n = 6;
  a = clement2 ( n );
  b = clement2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT3.
%
  title = 'CLEMENT3';
  n = 6;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n-1, seed );
  x(1:n-1) = round ( 50.0 * x(1:n-1) - 25.0 ) / 5.0;
  [ y, seed ] = r8vec_uniform_01 ( n-1, seed );
  y(1:n-1) = round ( 50.0 * y(1:n-1) - 25.0 ) / 5.0;
  a = clement3 ( n, x, y );
  b = clement3_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  COMBIN matrix.
%
  title = 'COMBIN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = combin ( alpha, beta, n );
  b = combin_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT3.
%
  title = 'COMPANION';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = companion ( n, x );
  b = companion_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  COMPLEX_I
%
  title = 'COMPLEX_I';
  n = 2;
  a = complex_i ( );
  b = complex_i_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX1 matrix.
%
  title = 'CONEX1';
  n = 4;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = conex1 ( alpha );
  b = conex1_inverse ( alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX2 matrix.
%
  title = 'CONEX2';
  n = 3;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = conex2 ( alpha );
  b = conex2_inverse ( alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX3 matrix.
%
  title = 'CONEX3';
  n = 5;
  a = conex3 ( n );
  b = conex3_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONFERENCE matrix.
%
  title = 'CONFERENCE';
  n = 6;
  a = conference ( n );
  b = conference_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB2 matrix.
%
  title = 'DAUB2';
  n = 4;
  a = daub2 ( n );
  b = daub2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB4 matrix.
%
  title = 'DAUB4';
  n = 8;
  a = daub4 ( n );
  b = daub4_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB6 matrix.
%
  title = 'DAUB6';
  n = 12;
  a = daub6 ( n );
  b = daub6_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB8 matrix.
%
  title = 'DAUB8';
  n = 16;
  a = daub8 ( n );
  b = daub8_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB10 matrix.
%
  title = 'DAUB10';
  n = 20;
  a = daub10 ( n );
  b = daub10_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB12 matrix.
%
  title = 'DAUB12';
  n = 24;
  a = daub12 ( n );
  b = daub12_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DIAGONAL.
%
  title = 'DIAGONAL';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = diagonal ( n, n, x );
  b = diagonal_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DIF2 matrix.
%
  title = 'DIF2';
  n = 5;
  a = dif2 ( n, n );
  b = dif2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DOWNSHIFT matrix.
%
  title = 'DOWNSHIFT';
  n = 5;
  a = downshift ( n );
  b = downshift_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DRMAC
%

%
%  EULERIAN matrix.
%
  title = 'EULERIAN';
  n = 5;
  a = eulerian ( n, n );
  b = eulerian_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  EXCHANGE matrix.
%
  title = 'EXCHANGE';
  n = 5;
  a = exchange ( n, n );
  b = exchange_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIBONACCI2 matrix.
%
  title = 'FIBONACCI2';
  n = 5;
  a = fibonacci2 ( n );
  b = fibonacci2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIBONACCI3 matrix.
%
  title = 'FIBONACCI3';
  n = 5;
  a = fibonacci3 ( n );
  b = fibonacci3_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIEDLER.
%  The FIEDLER_INVERSE routine assumes the X vector is sorted.
%
  title = 'FIEDLER';
  n = 7;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  x = sort ( x );
  a = fiedler ( n, n, x );
  b = fiedler_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FORSYTHE matrix.
%
  title = 'FORSYTHE';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = forsythe ( alpha, beta, n );
  b = forsythe_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FOURIER_COSINE matrix.
%
  title = 'FOURIER_COSINE';
  n = 5;
  a = fourier_cosine ( n );
  b = fourier_cosine_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FOURIER_SINE matrix.
%
  title = 'FOURIER_SINE';
  n = 5;
  a = fourier_sine ( n );
  b = fourier_sine_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FRANK matrix.
%
  title = 'FRANK';
  n = 5;
  a = frank ( n );
  b = frank_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GFPP matrix.
%
  title = 'GFPP';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  a = gfpp ( n, alpha );
  b = gfpp_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GIVENS matrix.
%
  title = 'GIVENS';
  n = 5;
  a = givens ( n, n );
  b = givens_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK316 matrix.
%
  title = 'GK316';
  n = 5;
  a = gk316 ( n );
  b = gk316_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK323 matrix.
%
  title = 'GK323';
  n = 5;
  a = gk323 ( n, n );
  b = gk323_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK324 matrix.
%
  title = 'GK324';
  n = 5;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = gk324 ( n, n, x );
  b = gk324_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HANOWA matrix.
%
  title = 'HANOWA';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  a = hanowa ( alpha, n );
  b = hanowa_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HARMAN matrix.
%
  title = 'HARMAN';
  n = 8;
  a = harman ( );
  b = harman_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HARTLEY matrix.
%
  title = 'HARTLEY';
  n = 5; 
  a = hartley ( n );
  b = hartley_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HELMERT matrix.
%
  title = 'HELMERT';
  n = 5; 
  a = helmert ( n );
  b = helmert_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HELMERT2 matrix.
%
  title = 'HELMERT2';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = helmert2 ( n, x );
  b = helmert2_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HERMITE matrix.
%
  title = 'HERMITE';
  n = 5; 
  a = hermite ( n );
  b = hermite_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HERNDON matrix.
%
  title = 'HERNDON';
  n = 5; 
  a = herndon ( n );
  b = herndon_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HILBERT matrix.
%
  title = 'HILBERT';
  n = 5; 
  a = hilbert ( n, n );
  b = hilbert_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HOUSEHOLDER matrix.
%
  title = 'HOUSEHOLDER';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = householder ( n, x );
  b = householder_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  IDENTITY matrix.
%
  title = 'IDENTITY';
  n = 5;
  a = identity ( n, n );
  b = identity_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ILL3 matrix.
%
  title = 'ILL3';
  n = 3;
  a = ill3 ( );
  b = ill3_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  INTEGRATION matrix.
%
  title = 'INTEGRATION';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = integration ( alpha, n );
  b = integration_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  INVOL matrix.
%
  title = 'INVOL';
  n = 5;
  a = invol ( n );
  b = invol_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  JORDAN matrix.
%
  title = 'JORDAN';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = jordan ( alpha, n, n );
  b = jordan_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KAHAN matrix.
%
  title = 'KAHAN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = kahan ( alpha, n, n );
  b = kahan_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KERSHAW matrix.
%
  title = 'KERSHAW';
  n = 4;
  a = kershaw ( );
  b = kershaw_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KERSHAWTRI matrix.
%
  title = 'KERSHAWTRI';
  n = 5;
  x_n = floor ( ( n + 1 ) / 2 );
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( x_n, seed );
  x(1:x_n) = round ( 50.0 * x(1:x_n) - 25.0 ) / 5.0;
  a = kershawtri ( n, x );
  b = kershawtri_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KMS matrix.
%
  title = 'KMS';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = kms ( alpha, n, n );
  b = kms_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LAGUERRE matrix.
%
  title = 'LAGUERRE';
  n = 5;
  a = laguerre ( n );
  b = laguerre_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LEGENDRE matrix.
%
  title = 'LEGENDRE';
  n = 5;
  a = legendre ( n );
  b = legendre_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LEHMER matrix.
%
  title = 'LEHMER';
  n = 5;
  a = lehmer ( n, n );
  b = lehmer_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LIETZKE matrix.
%
  title = 'LIETZKE';
  n = 5;
  a = lietzke ( n );
  b = lietzke_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LOTKIN matrix.
%
  title = 'LOTKIN';
  n = 5;
  a = lotkin ( n, n );
  b = lotkin_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MAXIJ matrix.
%
  title = 'MAXIJ';
  n = 5;
  a = maxij ( n, n );
  b = maxij_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MILNES matrix.
%
  title = 'MILNES';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = milnes ( n, n, x );
  b = milnes_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MINIJ matrix.
%
  title = 'MINIJ';
  n = 5;
  a = minij ( n, n );
  b = minij_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MOLER1 matrix.
%
  title = 'MOLER1';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = moler1 ( alpha, n, n );
  b = moler1_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MOLER3 matrix.
%
  title = 'MOLER3';
  n = 5;
  a = moler3 ( n, n );
  b = moler3_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ORTEGA matrix.
%
  title = 'ORTEGA';
  n = 5;
  [ v1, seed ] = r8vec_uniform_01 ( n, seed );
  v1(1:n) = round ( 50.0 * v1(1:n) - 25.0 ) / 5.0;
  [ v2, seed ] = r8vec_uniform_01 ( n, seed );
  v2(1:n) = round ( 50.0 * v2(1:n) - 25.0 ) / 5.0;
  [ v3, seed ] = r8vec_uniform_01 ( n, seed );
  v3(1:n) = round ( 50.0 * v3(1:n) - 25.0 ) / 5.0;
  a = ortega ( n, v1, v2, v3 );
  b = ortega_inverse ( n, v1, v2, v3 );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ORTH_SYMM matrix.
%
  title = 'ORTH_SYMM';
  n = 5;
  a = orth_symm ( n );
  b = orth_symm_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  OTO matrix.
%
  title = 'OTO';
  n = 5;
  a = oto ( n, n );
  b = oto_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PARTER matrix.
%
  title = 'PARTER';
  n = 5;
  a = parter ( n, n );
  b = parter_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL1 matrix.
%
  title = 'PASCAL1';
  n = 5;
  a = pascal1 ( n );
  b = pascal1_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL2 matrix.
%
  title = 'PASCAL2';
  n = 5;
  a = pascal2 ( n );
  b = pascal2_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL3 matrix.
%
  title = 'PASCAL3';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = pascal3 ( n, alpha );
  b = pascal3_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PDS_RANDOM matrix.
%
  title = 'PDS_RANDOM';
  n = 5;
  seed_save = 123456789;
  seed = seed_save;
  a = pds_random ( n, seed );
  seed = seed_save;
  b = pds_random_inverse ( n, seed );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PEI matrix.
%
  title = 'PEI';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = pei ( alpha, n );
  b = pei_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PERMUTATION_RANDOM matrix.
%
  title = 'PERMUTATION_RANDOM';
  n = 5;
  seed = 123456789;
  seed_save = seed;
  [ a, seed ] = permutation_random ( n, seed );
  seed = seed_save;
  b = permutation_random_inverse ( n, seed );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PLU matrix.
%
  title = 'PLU';
  n = 5;
  for i = 1 : n
    pivot(i) = i;
  end
  [ p, l, u, a ] = plu ( n, pivot );
  b = plu_inverse ( n, p, l, u );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RIS matrix.
%
  title = 'RIS';
  n = 5;
  a = ris ( n );
  b = ris_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RODMAN matrix.
%
  title = 'RODMAN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = rodman ( alpha, n, n );
  b = rodman_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS1 matrix.
%
  title = 'RUTIS1';
  n = 4;
  a = rutis1 ( );
  b = rutis1_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS2 matrix.
%
  title = 'RUTIS2';
  n = 4;
  a = rutis2 ( );
  b = rutis2_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS3 matrix.
%
  title = 'RUTIS3';
  n = 4;
  a = rutis3 ( );
  b = rutis3_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS4 matrix.
%
  title = 'RUTIS4';
  n = 4;
  a = rutis4 ( n );
  b = rutis4_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS5 matrix.
%
  title = 'RUTIS5';
  n = 4;
  a = rutis5 ( );
  b = rutis5_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SCHUR_BLOCK matrix.
%
  title = 'SCHUR_BLOCK';
  n = 5;
  seed = 123456789;
  x_n = floor ( ( n + 1 ) / 2 );
  [ x, seed ] = r8vec_uniform_01 ( x_n, seed );
  x(1:x_n) = round ( 50.0 * x(1:x_n) - 25.0 ) / 5.0;
  y_n = floor ( n / 2 );
  [ y, seed ] = r8vec_uniform_01 ( y_n, seed );
  y(1:y_n) = round ( 50.0 * y(1:y_n) - 25.0 ) / 5.0;
  a = schur_block ( n, x, y );
  b = schur_block_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SPLINE matrix.
%
  title = 'SPLINE';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n - 1, seed );
  x(1:n - 1) = round ( 50.0 * x(1:n - 1) - 25.0 ) / 5.0;
  a = spline ( n, x );
  b = spline_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  STIRLING matrix.
%
  title = 'STIRLING';
  n = 5;
  a = stirling ( n, n );
  b = stirling_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SUMMATION matrix.
%
  title = 'SUMMATION';
  n = 5;
  a = summation ( n, n );
  b = summation_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRI_UPPER matrix.
%
  title = 'TRI_UPPER';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = tri_upper ( alpha, n );
  b = tri_upper_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIS matrix.
%
  title = 'TRIS';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta - 25.0 ) / 5.0;
  [ gamma, seed ] = r8_uniform_01 ( seed );
  gamma = round ( 50.0 * gamma - 25.0 ) / 5.0;
  a = tris ( n, n, alpha, beta, gamma );
  b = tris_inverse ( n, alpha, beta, gamma );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIV matrix.
%
  title = 'TRIV';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n-1, seed );
  x(1:n-1) = round ( 50.0 * x(1:n-1) - 25.0 ) / 5.0;
  [ y, seed ] = r8vec_uniform_01 ( n, seed );
  y(1:n) = round ( 50.0 * y(1:n) - 25.0 ) / 5.0;
  [ z, seed ] = r8vec_uniform_01 ( n-1, seed );
  z(1:n-1) = round ( 50.0 * z(1:n-1) - 25.0 ) / 5.0;
  a = triv ( n, x, y, z );
  b = triv_inverse ( n, x, y, z );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIW matrix.
%
  title = 'TRIW';
  n = 5;
  seed = 123456789;
  [ k, seed ] = i4_uniform ( 0, n-1, seed );
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = triw ( alpha, k, n );
  b = triw_inverse ( alpha, k, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  UPSHIFT matrix.
%
  title = 'UPSHIFT';
  n = 5;
  a = upshift ( n );
  b = upshift_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  VAND1 matrix.
%
  title = 'VAND1';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = vand1 ( n, x );
  b = vand1_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  VAND2 matrix.
%
  title = 'VAND2';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = vand2 ( n, x );
  b = vand2_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK03 matrix.
%
  title = 'WILK03';
  n = 3;
  a = wilk03 ( );
  b = wilk03_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK04 matrix.
%
  title = 'WILK04';
  n = 4;
  a = wilk04 ( );
  b = wilk04_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK05 matrix.
%
  title = 'WILK05';
  n = 5;
  a = wilk05 ( );
  b = wilk05_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK21 matrix.
%
  title = 'WILK21';
  n = 21;
  a = wilk21 ( n );
  b = wilk21_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILSON matrix.
%
  title = 'WILSON';
  n = 4;
  a = wilson ( );
  b = wilson_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '%20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );

  return
end
