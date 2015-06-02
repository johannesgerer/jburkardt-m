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
%    17 April 2015
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
  fprintf ( 1, '  Title                    N      ' );
  fprintf ( 1, '||A||      ||C||      ||I-AC||        ||I-AB||\n' );
  fprintf ( 1, '\n' );
%
%  AEGERTER
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BAB
%
  title = 'BAB';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = bab ( n, alpha, beta );
  b = bab_inverse ( n, alpha, beta );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BAUER
%
  title = 'BAUER';
  n = 6;
  a = bauer ( );
  b = bauer_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BERNSTEIN
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BIS
%
  title = 'BIS';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = bis ( alpha, beta, n, n );
  b = bis_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BIW
%
  title = 'BIW';
  n = 5;
  a = biw ( n );
  b = biw_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BODEWIG
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BOOTHROYD
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  BORDERBAND
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CARRY
%
  title = 'CARRY';
  n = 5;
  i4_lo = 2;
  i4_hi = 20;
  seed = 123456789;
  [ k, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
  a = carry ( n, k );
  b = carry_inverse ( n, k );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CAUCHY
%
  title = 'CAUCHY';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = cauchy ( n, x, y );
  b = cauchy_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_T
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_U
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_VAN2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHEBY_VAN3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CHOW
%
  title = 'CHOW';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = chow ( alpha, beta, n, n );
  b = chow_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CIRCULANT
%
  title = 'CIRCULANT';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = circulant ( n, n, x );
  b = circulant_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CIRCULANT2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT1
%  N must be even.
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CLEMENT2
%  N must be even.
%
  title = 'CLEMENT2';
  n = 6;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  a = clement2 ( n, x, y );
  b = clement2_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  COMBIN
%
  title = 'COMBIN';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = combin ( alpha, beta, n );
  b = combin_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  COMPANION
%
  title = 'COMPANION';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = companion ( n, x );
  b = companion_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX1
%
  title = 'CONEX1';
  n = 4;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = conex1 ( alpha );
  b = conex1_inverse ( alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX2
%
  title = 'CONEX2';
  n = 3;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = conex2 ( alpha );
  b = conex2_inverse ( alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONEX3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  CONFERENCE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB4
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB6
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB8
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB10
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DAUB12
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DIAGONAL
%
  title = 'DIAGONAL';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = diagonal ( n, n, x );
  b = diagonal_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DIF1
%  N must be even.
%
  title = 'DIF1';
  n = 6;
  a = dif1 ( n, n );
  b = dif1_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DIF2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DORR
%
  title = 'DORR';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = dorr ( alpha, n );
  b = dorr_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  DOWNSHIFT
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  EULERIAN
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  EXCHANGE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIBONACCI2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIBONACCI3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FIEDLER.
%  The FIEDLER_INVERSE routine assumes the X vector is sorted.
%
  title = 'FIEDLER';
  n = 7;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  x = sort ( x );
  a = fiedler ( n, n, x );
  b = fiedler_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FORSYTHE
%
  title = 'FORSYTHE';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = forsythe ( alpha, beta, n );
  b = forsythe_inverse ( alpha, beta, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FOURIER_COSINE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FOURIER_SINE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  FRANK
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GFPP
%
  title = 'GFPP';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = gfpp ( n, alpha );
  b = gfpp_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GIVENS
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK316
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK323
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  GK324
%
  title = 'GK324';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  a = gk324 ( n, n, x );
  b = gk324_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HANKEL_N
%
  title = 'HANKEL_N';
  n = 6;
  a = hankel_n ( n );
  b = hankel_n_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HANOWA
%
  title = 'HANOWA';
  n = 6;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = hanowa ( alpha, n );
  b = hanowa_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HARMAN
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HARTLEY
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HELMERT
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HELMERT2
%
  title = 'HELMERT2';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = helmert2 ( n, x );
  b = helmert2_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HERMITE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HERNDON
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HILBERT
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  HOUSEHOLDER
%
  title = 'HOUSEHOLDER';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = householder ( n, x );
  b = householder_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  IDENTITY
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ILL3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  INTEGRATION
%
  title = 'INTEGRATION';
  n = 6;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = integration ( alpha, n );
  b = integration_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  INVOL
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  JACOBI
%  N must be even.
%
  title = 'JACOBI';
  n = 6
  a = jacobi ( n, n );
  b = jacobi_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  JORDAN
%
  title = 'JORDAN';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = jordan ( n, n, alpha );
  b = jordan_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KAHAN
%
  title = 'KAHAN';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = kahan ( alpha, n, n );
  b = kahan_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KERSHAW
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KERSHAWTRI
%
  title = 'KERSHAWTRI';
  n = 5;
  x_n = floor ( ( n + 1 ) / 2 );
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( x_n, r8_lo, r8_hi, seed );
  a = kershawtri ( n, x );
  b = kershawtri_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  KMS
%
  title = 'KMS';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = kms ( alpha, n, n );
  b = kms_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LAGUERRE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LEGENDRE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LEHMER
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LESP
%
  title = 'LESP';
  n = 5;
  a = lesp ( n, n );
  b = lesp_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LIETZKE
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LINE_ADJ
%  N must be even.
%
  title = 'LINE_ADJ';
  n = 6;
  a = line_adj ( n );
  b = line_adj_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  LOTKIN
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MAXIJ
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MILNES
%
  title = 'MILNES';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = milnes ( n, n, x );
  b = milnes_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MINIJ
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MOLER1
%
  title = 'MOLER1';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = moler1 ( alpha, n, n );
  b = moler1_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  MOLER3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ORTEGA
%
  title = 'ORTEGA';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ v1, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ v2, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ v3, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = ortega ( n, v1, v2, v3 );
  b = ortega_inverse ( n, v1, v2, v3 );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  ORTH_SYMM
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  OTO
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PARTER
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL1
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PASCAL3
%
  title = 'PASCAL3';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = pascal3 ( n, alpha );
  b = pascal3_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PDS_RANDOM
%
  title = 'PDS_RANDOM';
  n = 5;
  key = 123456789;
  a = pds_random ( n, key );
  b = pds_random_inverse ( n, key );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PEI
%
  title = 'PEI';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = pei ( alpha, n );
  b = pei_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  PERMUTATION_RANDOM
%
  title = 'PERMUTATION_RANDOM';
  n = 5;
  key = 123456789;
  a = permutation_random ( n, key );
  b = permutation_random_inverse ( n, key );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
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
  b = plu_inverse ( n, pivot );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RIS
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RODMAN
%
  title = 'RODMAN';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = rodman ( n, n, alpha );
  b = rodman_inverse ( n, alpha );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS1
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS2
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS3
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS4
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  RUTIS5
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SCHUR_BLOCK
%
  title = 'SCHUR_BLOCK';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  x_n = floor ( ( n + 1 ) / 2 );
  [ x, seed ] = r8vec_uniform_ab ( x_n, r8_lo, r8_hi, seed );
  y_n = floor ( n / 2 );
  [ y, seed ] = r8vec_uniform_ab ( y_n, r8_lo, r8_hi, seed );
  a = schur_block ( n, x, y );
  b = schur_block_inverse ( n, x, y );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SPLINE
%
  title = 'SPLINE';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  a = spline ( n, x );
  b = spline_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  STIRLING
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SUMMATION
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SWEET1
%
  title = 'SWEET1';
  n = 6;
  a = sweet1 ( );
  b = sweet1_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SWEET2
%
  title = 'SWEET2';
  n = 6;
  a = sweet2 ( );
  b = sweet2_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SWEET3
%
  title = 'SWEET3';
  n = 6;
  a = sweet3 ( );
  b = sweet3_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SWEET4
%
  title = 'SWEET4';
  n = 13;
  a = sweet4 ( );
  b = sweet4_inverse ( );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SYLVESTER_KAC
%  N must be even.
%
  title = 'SYLVESTER_KAC';
  n = 6;
  a = sylvester_kac ( n );
  b = sylvester_kac_inverse ( n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  SYMM_RANDOM
%
  title = 'SYMM_RANDOM';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  key = 123456789;
  a = symm_random ( n, x, key );
  b = symm_random_inverse ( n, x, key );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRI_UPPER
%
  title = 'TRI_UPPER';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = tri_upper ( alpha, n );
  b = tri_upper_inverse ( alpha, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIS
%
  title = 'TRIS';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ gamma, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = tris ( n, n, alpha, beta, gamma );
  b = tris_inverse ( n, alpha, beta, gamma );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIV
%
  title = 'TRIV';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ z, seed ] = r8vec_uniform_ab ( n - 1, r8_lo, r8_hi, seed );
  a = triv ( n, x, y, z );
  b = triv_inverse ( n, x, y, z );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  TRIW
%
  title = 'TRIW';
  n = 5;
  i4_lo = 0;
  i4_hi = n - 1;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ k, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = triw ( alpha, k, n );
  b = triw_inverse ( alpha, k, n );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  UNITARY_RANDOM
%
  title = 'UNITARY_RANDOM';
  n = 5;
  key = 123456789;
  a = unitary_random ( n, key );
  b = unitary_random_inverse ( n, key );
  c = inv ( a );
  error_ab = c8mat_is_inverse ( n, a, b );
  error_ac = c8mat_is_inverse ( n, a, c );
  norma_frobenius = c8mat_norm_fro ( n, n, a );
  normc_frobenius = c8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  UPSHIFT
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  VAND1
%
  title = 'VAND1';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = vand1 ( n, x );
  b = vand1_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  VAND2
%
  title = 'VAND2';
  n = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = vand2 ( n, x );
  b = vand2_inverse ( n, x );
  c = inv ( a );
  error_ab = r8mat_is_inverse ( n, a, b );
  error_ac = r8mat_is_inverse ( n, a, c );
  norma_frobenius = r8mat_norm_fro ( n, n, a );
  normc_frobenius = r8mat_norm_fro ( n, n, c );
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK03
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK04
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK05
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILK21
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );
%
%  WILSON
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
  fprintf ( 1, '  %-20s  %4d  %10.2g  %10.2g  %14g  %14g\n', ...
    title, n, norma_frobenius, normc_frobenius, error_ac, error_ab );

  return
end
