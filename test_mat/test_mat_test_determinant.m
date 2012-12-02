function test_determinant ( )

%*****************************************************************************80
%
%% TEST_DETERMINANT tests the determinant computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_DETERMINANT\n' );
  fprintf ( 1, '  Compute the determinants of an example of each\n' );
  fprintf ( 1, '  test matrix; compare with the determinant routine,\n' );
  fprintf ( 1, '  if available.  Print the matrix Frobenius norm\n' );
  fprintf ( 1, '  for an estimate of magnitude.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix title           N      ' );
  fprintf ( 1, 'Determ          Determ          ||A||\n' );
  fprintf ( 1, '\n' );
%
%  AEGERTER matrix.
%
  title = 'AEGERTER';
  n = 5;
  a = aegerter ( n );
  determ1 = aegerter_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ANTICIRCULANT matrix.
%
  title = 'ANTICIRCULANT';
  n = 3;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = anticirculant ( n, n, x );
  determ1 = anticirculant_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ANTICIRCULANT matrix.
%
  title = 'ANTICIRCULANT';
  n = 4;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = anticirculant ( n, n, x );
  determ1 = anticirculant_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ANTICIRCULANT matrix.
%
  title = 'ANTICIRCULANT';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = anticirculant ( n, n, x );
  determ1 = anticirculant_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ANTIHADAMARD matrix.
%
  title = 'ANTIHADAMARD';
  n = 5;
  a = antihadamard ( n );
  determ1 = antihadamard_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ANTISYMM_RANDOM matrix.
%
  title = 'ANTISYMM_RANDOM';
  n = 5;
  seed = 123456789;
  [ a, seed ] = antisymm_random ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  ANTISYMM_RANDOM matrix.
%
  title = 'ANTISYMM_RANDOM';
  n = 6;
  seed = 123456789;
  [ a, seed ] = antisymm_random ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  BAB matrix.
%
  title = 'BAB';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta -25.0 ) / 5.0;
  a = bab ( n, alpha, beta );
  determ1 = bab_determinant ( n, alpha, beta );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  BIMARKOV_RANDOM matrix.
%
  title = 'BIMARKOV_RANDOM';
  n = 5;
  seed = 123456789;
  [ a, seed ] = bimarkov_random ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,         determ2, norm_frobenius );
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
  determ1 = bis_determinant ( alpha, beta, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  n = 4;
  a = bodewig ( );
  determ1 = bodewig_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  BOOTHROYD matrix.
%
  title = 'BOOTHROYD';
  n = 5;
  a = boothroyd ( n );
  determ1 = boothroyd_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  BORDERBAND matrix.
%
  title = 'BORDERBAND';
  n = 5;
  a = borderband ( n );
  determ1 = borderband_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CARRY matrix.
%
  title = 'CARRY';
  n = 5;
  seed = 123456789;
  [ k, seed ] = i4_uniform ( 2, 20, seed );
  a = carry ( k, n );
  determ1 = carry_determinant ( k, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CAUCHY matrix.
%
  title = 'CAUCHY';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  [ y, seed ] = r8vec_uniform_01 ( n, seed );
  a = cauchy ( n, x, y );
  determ1 = cauchy_determinant ( n, x, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_DIFF1 matrix.
%
  title = 'CHEBY_DIFF1';
  n = 5;
  a = cheby_diff1 ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  CHEBY_DIFF1 matrix.
%
  title = 'CHEBY_DIFF1';
  n = 6;
  a = cheby_diff1 ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  CHEBY_T matrix.
%
  title = 'CHEBY_T';
  n = 5;
  a = cheby_t ( n );
  determ1 = cheby_t_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_U matrix.
%
  title = 'CHEBY_U';
  n = 5;
  a = cheby_u ( n );
  determ1 = cheby_u_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN1 matrix.
%
  title = 'CHEBY_VAN1';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = cheby_van1 ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 2;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 3;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 4;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 5;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN3 matrix.
%
  title = 'CHEBY_VAN3';
  n = 5;
  a = cheby_van3 ( n );
  determ1 = cheby_van3_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 6;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 7;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 8;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 9;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CHEBY_VAN2 matrix.
%
  title = 'CHEBY_VAN2';
  n = 10;
  a = cheby_van2 ( n );
  determ1 = cheby_van2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = chow_determinant ( alpha, beta, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CIRCULANT matrix.
%
  title = 'CIRCULANT';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = circulant ( n, n, x );
  determ1 = circulant_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CIRCULANT2 matrix.
%
  title = 'CIRCULANT2';
  n = 3;
  a = circulant2 ( n );
  determ1 = circulant2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CIRCULANT2 matrix.
%
  title = 'CIRCULANT2';
  n = 4;
  a = circulant2 ( n );
  determ1 = circulant2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CIRCULANT2 matrix.
%
  title = 'CIRCULANT2';
  n = 5;
  a = circulant2 ( n );
  determ1 = circulant2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CLEMENT1 matrix.
%
  title = 'CLEMENT1';
  n = 5;
  a = clement1 ( n );
  determ1 = clement1_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CLEMENT1 matrix.
%
  title = 'CLEMENT1';
  n = 6;
  a = clement1 ( n );
  determ1 = clement1_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CLEMENT2 matrix.
%
  title = 'CLEMENT2';
  n = 5;
  a = clement2 ( n );
  determ1 = clement2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CLEMENT2 matrix.
%
  title = 'CLEMENT2';
  n = 6;
  a = clement2 ( n );
  determ1 = clement2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CLEMENT3.
%
  title = 'CLEMENT3';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n-1, seed );
  x(1:n-1) = round ( 50.0 * x(1:n-1) - 25.0 ) / 5.0;
  [ y, seed ] = r8vec_uniform_01 ( n-1, seed );
  y(1:n-1) = round ( 50.0 * y(1:n-1) - 25.0 ) / 5.0;
  a = clement3 ( n, x, y );
  determ1 = clement3_determinant ( n, x, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = clement3_determinant ( n, x, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = combin_determinant ( alpha, beta, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  COMPANION.
%
  title = 'COMPANION';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = companion ( n, x );
  determ1 = companion_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  COMPLEX_I
%
  title = 'COMPLEX_I';
  n = 2;
  a = complex_i ( );
  determ1 = complex_i_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CONEX1 matrix.
%
  title = 'CONEX1';
  n = 4;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = conex1 ( alpha );
  determ1 = conex1_determinant ( alpha );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CONEX2 matrix.
%
  title = 'CONEX2';
  n = 3;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = conex2 ( alpha );
  determ1 = conex2_determinant ( alpha );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CONEX3 matrix.
%
  title = 'CONEX3';
  n = 5;
  a = conex3 ( n );
  determ1 = conex3_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CONFERENCE matrix.
%
  title = 'CONFERENCE';
  n = 6;
  a = conference ( n );
  determ1 = conference_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  CREATION matrix.
%
  title = 'CREATION';
  n = 5;
  a = creation ( n, n );
  determ1 = creation_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB2 matrix.
%
  title = 'DAUB2';
  n = 4;
  a = daub2 ( n );
  determ1 = daub2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB4 matrix.
%
  title = 'DAUB4';
  n = 8;
  a = daub4 ( n );
  determ1 = daub4_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB6 matrix.
%
  title = 'DAUB6';
  n = 12;
  a = daub6 ( n );
  determ1 = daub6_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB8 matrix.
%
  title = 'DAUB8';
  n = 16;
  a = daub8 ( n );
  determ1 = daub8_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB10 matrix.
%
  title = 'DAUB10';
  n = 20;
  a = daub10 ( n );
  determ1 = daub10_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DAUB12 matrix.
%
  title = 'DAUB12';
  n = 24;
  a = daub12 ( n );
  determ1 = daub12_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DIAGONAL.
%
  title = 'DIAGONAL';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = diagonal ( n, n, x );
  determ1 = diagonal_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DIF1 matrix.
%
  title = 'DIF1';
  n = 5;
  a = dif1 ( n, n );
  determ1 = dif1_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DIF1CYCLIC matrix.
%
  title = 'DIF1CYCLIC';
  n = 5;
  a = dif1cyclic ( n );
  determ1 = dif1cyclic_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DIF2 matrix.
%
  title = 'DIF2';
  n = 5;
  a = dif2 ( n, n );
  determ1 = dif2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DIF2CYCLIC matrix.
%
  title = 'DIF2CYCLIC';
  n = 5;
  a = dif2cyclic ( n );
  determ1 = dif2cyclic_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  DORR matrix.
%
  title = 'DORR';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = dorr ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  DOWNSHIFT matrix.
%
  title = 'DOWNSHIFT';
  n = 5;
  a = downshift ( n );
  determ1 = downshift_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  EBERLEIN matrix.
%
  title = 'EBERLEIN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = eberlein ( alpha, n );
  determ1 = eberlein_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  EULERIAN matrix.
%
  title = 'EULERIAN';
  n = 5;
  a = eulerian ( n, n );
  determ1 = eulerian_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  EXCHANGE matrix.
%
  title = 'EXCHANGE';
  n = 5;
  a = exchange ( n, n );
  determ1 = exchange_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FIBONACCI1 matrix.
%
  title = 'FIBONACCI1';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = fibonacci1 ( n, alpha, beta );
  determ1 = fibonacci1_determinant ( n, alpha, beta );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FIBONACCI2 matrix.
%
  title = 'FIBONACCI2';
  n = 5;
  a = fibonacci2 ( n );
  determ1 = fibonacci2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FIBONACCI3 matrix.
%
  title = 'FIBONACCI3';
  n = 5;
  a = fibonacci3 ( n );
  determ1 = fibonacci3_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FIEDLER.
%
  title = 'FIEDLER';
  n = 7;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = fiedler ( n, n, x );
  determ1 = fiedler_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = forsythe_determinant ( alpha, beta, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FOURIER_COSINE matrix.
%
  title = 'FOURIER_COSINE';
  n = 5;
  a = fourier_cosine ( n );
  determ1 = fourier_cosine_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FOURIER_SINE matrix.
%
  title = 'FOURIER_SINE';
  n = 5;
  a = fourier_sine ( n );
  determ1 = fourier_sine_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  FRANK matrix.
%
  title = 'FRANK';
  n = 5;
  a = frank ( n );
  determ1 = frank_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GEAR matrix.
%
  for n = 4 : 8
    title = 'GEAR';
    seed = 123456789;
    [ ii, seed ] = i4_uniform ( -n, n, seed );
    [ jj, seed ] = i4_uniform ( -n, n, seed );
    a = gear ( ii, jj, n );
    determ1 = gear_determinant ( ii, jj, n );
    determ2 = det ( a );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
      title, n, determ1, determ2, norm_frobenius );
  end
%
%  GFPP matrix.
%
  title = 'GFPP';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = gfpp ( n, alpha );
  determ1 = gfpp_determinant ( n, alpha );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GIVENS matrix.
%
  title = 'GIVENS';
  n = 5;
  a = givens ( n, n );
  determ1 = givens_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GK316 matrix.
%
  title = 'GK316';
  n = 5;
  a = gk316 ( n );
  determ1 = gk316_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GK323 matrix.
%
  title = 'GK323';
  n = 5;
  a = gk323 ( n, n );
  determ1 = gk323_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GK324 matrix.
%
  title = 'GK324';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = gk324 ( n, n, x );
  determ1 = gk324_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  GRCAR matrix.
%
  title = 'GRCAR';
  n = 5;
  seed = 123456789;
  [ k, seed ] = i4_uniform ( 1, n-1, seed );
  a = grcar ( n, n, k );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  HADAMARD matrix.
%
  title = 'HADAMARD';
  n = 5;
  a = hadamard ( n, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  HANKEL matrix.
%
  title = 'HANKEL';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( 2 * n - 1, seed );
  x(1:2*n-1) = round ( 50.0 * x(1:2*n-1) - 25.0 ) / 5.0;
  a = hankel ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  HANOWA matrix.
%
  title = 'HANOWA';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = hanowa ( alpha, n );
  determ1 = hanowa_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HARMAN matrix.
%
  title = 'HARMAN';
  n = 8;
  a = harman ( );
  determ1 = harman_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HARTLEY matrix.
%
  for n = 5 : 8
    title = 'HARTLEY';
    a = hartley ( n );
    determ1 = hartley_determinant ( n );
    determ2 = det ( a );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
      title, n, determ1, determ2, norm_frobenius );
  end
%
%  HELMERT matrix.
%
  title = 'HELMERT';
  n = 5; 
  a = helmert ( n );
  determ1 = helmert_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HELMERT2 matrix.
%
  title = 'HELMERT2';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = helmert2 ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  HERMITE matrix.
%
  title = 'HERMITE';
  n = 5; 
  a = hermite ( n );
  determ1 = hermite_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HERNDON matrix.
%
  title = 'HERNDON';
  n = 5; 
  a = herndon ( n );
  determ1 = herndon_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HILBERT matrix.
%
  title = 'HILBERT';
  n = 5; 
  a = hilbert ( n, n );
  determ1 = hilbert_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  HOUSEHOLDER matrix.
%
  title = 'HOUSEHOLDER';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = householder ( n, x );
  determ1 = householder_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  IDEM_RANDOM matrix.
%
  title = 'IDEM_RANDOM';
  n = 5;
  seed = 123456789;
  [ rank, seed ] = i4_uniform ( 0, n, seed );
  [ a, seed ] = idem_random ( n, rank, seed );
  determ1 = idem_random_determinant ( n, rank );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  IDENTITY matrix.
%
  title = 'IDENTITY';
  n = 5;
  a = identity ( n, n );
  determ1 = identity_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  IJFACT1 matrix.
%
  title = 'IJFACT1';
  n = 5;
  a = ijfact1 ( n );
  determ1 = ijfact1_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  IJFACT2 matrix.
%
  title = 'IJFACT2';
  n = 5;
  a = ijfact2 ( n );
  determ1 = ijfact2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ILL3 matrix.
%
  title = 'ILL3';
  n = 3;
  a = ill3 ( );
  determ1 = ill3_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  INTEGRATION matrix.
%
  title = 'INTEGRATION';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = integration ( alpha, n );
  determ1 = integration_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  INVOL matrix.
%
  title = 'INVOL';
  n = 5;
  a = invol ( n );
  determ1 = invol_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  INVOL_RANDOM matrix.
%
  title = 'INVOL_RANDOM';
  n = 5;
  seed = 123456789;
  [ rank, seed ] = i4_uniform ( 0, n, seed );
  [ a, seed ] = invol_random ( n, rank, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  JACOBI matrix.
%
  title = 'JACOBI';
  n = 5;
  a = jacobi ( n, n );
  determ1 = jacobi_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  JACOBI matrix.
%
  title = 'JACOBI';
  n = 6;
  a = jacobi ( n, n );
  determ1 = jacobi_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  JORDAN matrix.
%
  title = 'JORDAN';
  n = 6;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = jordan ( alpha, n, n );
  determ1 = jordan_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  KAHAN matrix.
%
  title = 'KAHAN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = kahan ( alpha, n, n );
  determ1 = kahan_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  KERSHAW matrix.
%
  title = 'KERSHAW';
  n = 4;
  a = kershaw ( );
  determ1 = kershaw_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = kershawtri_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  KMS matrix.
%
  title = 'KMS';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = kms ( alpha, n, n );
  determ1 = kms_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LAGUERRE matrix.
%
  title = 'LAGUERRE';
  n = 5;
  a = laguerre ( n );
  determ1 = laguerre_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LEHMER matrix.
%
  title = 'LEHMER';
  n = 5;
  a = lehmer ( n, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  LESLIE matrix.
%
  title = 'LESLIE';
  n = 4;
  b =  0.025;
  di = 0.010;
  da = 0.100;
  a = leslie ( b, di, da );
  determ1 = leslie_determinant ( b, di, da );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LESP matrix.
%
  title = 'LESP';
  n = 5;
  a = lesp ( n, n );
  determ1 = lesp_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LIETZKE matrix.
%
  title = 'LIETZKE';
  n = 5;
  a = lietzke ( n );
  determ1 = lietzke_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LIGHTS_OUT matrix.
%
  title = 'LIGHTS_OUT';
  row_num = 5;
  col_num = 5;
  [ n, a ] = lights_out ( row_num, col_num );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  LINE_ADJ matrix.
%
  title = 'LINE_ADJ';
  n = 5;
  a = line_adj ( n );
  determ1 = line_adj_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LINE_LOOP_ADJ matrix.
%
  title = 'LINE_LOOP_ADJ';
  n = 5;
  a = line_loop_adj ( n );
  determ1 = line_loop_adj_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  LOEWNER matrix.
%
  title = 'LOEWNER';
  n = 5;
  seed = 123456789;
  [ w, seed ] = r8vec_uniform_01 ( n, seed );
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  [ y, seed ] = r8vec_uniform_01 ( n, seed );
  [ z, seed ] = r8vec_uniform_01 ( n, seed );
  a = loewner ( w, x, y, z, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  LOTKIN matrix.
%
  title = 'LOTKIN';
  n = 5;
  a = lotkin ( n, n );
  determ1 = lotkin_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MARKOV_RANDOM matrix.
%
  title = 'MARKOV_RANDOM';
  n = 5;
  seed = 123456789;
  [ a, seed ] = markov_random ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  MAXIJ matrix.
%
  title = 'MAXIJ';
  n = 5;
  a = maxij ( n, n );
  determ1 = maxij_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MILNES matrix.
%
  title = 'MILNES';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = milnes ( n, n, x );
  determ1 = milnes_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MINIJ matrix.
%
  title = 'MINIJ';
  n = 5;
  a = minij ( n, n );
  determ1 = minij_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MOLER1 matrix.
%
  title = 'MOLER1';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = moler1 ( alpha, n, n );
  determ1 = moler1_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MOLER2 matrix.
%
  title = 'MOLER2';
  n = 5;
  a = moler2 ( );
  determ1 = moler2_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  MOLER3 matrix.
%
  title = 'MOLER3';
  n = 5;
  a = moler3 ( n, n );
  determ1 = moler3_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  NEUMANN matrix.
%
  title = 'NEUMANN';
  row_num = 5;
  col_num = 5;
  [ n, a ] = neumann ( row_num, col_num );
  determ1 = neumann_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ONE matrix.
%
  title = 'ONE';
  n = 5;
  a = one ( n, n );
  determ1 = one_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = ortega_determinant ( n, v1, v2, v3 );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ORTH_RANDOM matrix.
%
  title = 'ORTH_RANDOM';
  n = 5;
  seed = 123456789;
  [ a, seed ] = orth_random ( n, seed );
  determ1 = orth_random_determinant ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ORTH_SYMM matrix.
%
  title = 'ORTH_SYMM';
  n = 5;
  a = orth_symm ( n );
  determ1 = orth_symm_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  OTO matrix.
%
  title = 'OTO';
  n = 5;
  a = oto ( n, n );
  determ1 = oto_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PARTER matrix.
%
  title = 'PARTER';
  n = 5;
  a = parter ( n, n );
  determ1 = parter_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PASCAL1 matrix.
%
  title = 'PASCAL1';
  n = 5;
  a = pascal1 ( n );
  determ1 = pascal1_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PASCAL2 matrix.
%
  title = 'PASCAL2';
  n = 5;
  a = pascal2 ( n );
  determ1 = pascal2_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PASCAL3 matrix.
%
  title = 'PASCAL3';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = pascal3 ( n, alpha );
  determ1 = pascal3_determinant ( n, alpha );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PDS_RANDOM matrix.
%
  title = 'PDS_RANDOM';
  n = 5;
  seed = 123456789;
  seed_save = seed;
  [ a, seed ] = pds_random ( n, seed );
  seed = seed_save;
  determ1 = pds_random_determinant ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PEI matrix.
%
  title = 'PEI';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = pei ( alpha, n );
  determ1 = pei_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PERMUTATION_RANDOM matrix.
%
  title = 'PERMUTATION_RANDOM';
  n = 5;
  seed = 123456789;
  seed_save = seed;
  [ a, seed ] = permutation_random ( n, seed );
  seed = seed_save;
  determ1 = permutation_random_determinant ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PLU matrix.
%
  title = 'PLU';
  n = 5;
  for i = 1 : n
    pivot(i) = i;
  end
  [ p, l, u, a ] = plu ( n, pivot );
  determ1 = plu_determinant ( n, p, l, u );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  POISSON matrix.
%
  title = 'POISSON';
  row_num = 5;
  col_num = 5;
  n = row_num * col_num;
  a = poisson ( row_num, col_num, n );
  determ1 = poisson_determinant ( row_num, col_num, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  PROLATE matrix.
%
  title = 'PROLATE';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = prolate ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  RECTANGLE_ADJ matrix.
%
  title = 'RECTANGLE_ADJ';
  row_num = 5;
  col_num = 5;
  n = row_num * col_num;
  a = rectangle_adj ( row_num, col_num, n  );
  determ1 = rectangle_adj_determinant ( row_num, col_num );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  REDHEFFER matrix.
%
  title = 'REDHEFFER';
  n = 5;
  a = redheffer ( n );
  determ1 = redheffer_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  REF_RANDOM matrix.
%
  title = 'REF_RANDOM';
  n = 5;
  prob = 0.85;
  seed_save = 123456789;
  seed = seed_save;
  [ a, seed ] = ref_random ( n, n, prob, seed );
  seed = seed_save;
  [ determ1, seed ] = ref_random_determinant ( n, prob, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RIEMANN matrix.
%
  title = 'RIEMANN';
  n = 5;
  a = riemann ( n, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  RING_ADJ matrix.
%
  for n = 1 : 8
    title = 'RING_ADJ';
    a = ring_adj ( n );
    determ1 = ring_adj_determinant ( n );
    determ2 = det ( a );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
      title, n, determ1, determ2, norm_frobenius );
  end
%
%  RIS matrix.
%
  title = 'RIS';
  n = 5;
  a = ris ( n );
  determ1 = ris_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RODMAN matrix.
%
  title = 'RODMAN';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = rodman ( alpha, n, n );
  determ1 = rodman_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ROSSER1 matrix.
%
%  Note that while the correct determinant of this matrix is 0,
%  that value is very difficult to calculate correctly.  MATLAB
%  returns det ( A ) = -10611, for instance.
%
  title = 'ROSSER1';
  n = 8;
  a = rosser1 ( );
  determ1 = rosser1_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ROUTH matrix.
%
  title = 'ROUTH';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) ) / 5.0;
  a = routh ( n, x );
  determ1 = routh_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RUTIS1 matrix.
%
  title = 'RUTIS1';
  n = 4;
  a = rutis1 ( );
  determ1 = rutis1_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RUTIS2 matrix.
%
  title = 'RUTIS2';
  n = 4;
  a = rutis2 ( );
  determ1 = rutis2_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RUTIS3 matrix.
%
  title = 'RUTIS3';
  n = 4;
  a = rutis3 ( );
  determ1 = rutis3_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RUTIS4 matrix.
%
  title = 'RUTIS4';
  n = 5;
  a = rutis4 ( n );
  determ1 = rutis4_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  RUTIS5 matrix.
%
  title = 'RUTIS5';
  n = 4;
  a = rutis5 ( );
  determ1 = rutis5_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = schur_block_determinant ( n, x, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  SKEW_CIRCULANT matrix.
%
  title = 'SKEW_CIRCULANT';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = skew_circulant ( n, n, x );
  determ1 = skew_circulant_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  SMOKE1 matrix.
%  (complex matrix)
%
  if ( 0 )
    title = 'SMOKE1';
    n = 5;
    a = smoke1 ( n );
    determ1 = smoke1_determinant ( n );
    determ2 = det ( a );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
      title, n, determ1, determ2, norm_frobenius );
  end
%
%  SMOKE2 matrix.
%  (complex matrix)
%
  if ( 0 )
    title = 'SMOKE2';
    n = 5;
    a = smoke2 ( n );
    determ1 = smoke2_determinant ( n );
    determ2 = det ( a );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
      title, n, determ1, determ2, norm_frobenius );
  end
%
%  SPLINE matrix.
%
  title = 'SPLINE';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = spline ( n, x );
  determ1 = spline_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  STIRLING matrix.
%
  title = 'STIRLING';
  n = 5;
  a = stirling ( n, n );
  determ1 = stirling_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  STRIPE matrix.
%
  title = 'STRIPE';
  n = 5;
  a = stripe ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  SUMMATION matrix.
%
  title = 'SUMMATION';
  n = 5;
  a = summation ( n, n );
  determ1 = summation_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  SWEET1 matrix.
%
  title = 'SWEET1';
  n = 6;
  perturb = 0.0;
  a = sweet1 ( perturb );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  SWEET2 matrix.
%
  title = 'SWEET2';
  n = 6;
  perturb = 0.0;
  a = sweet2 ( perturb );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  SWEET3 matrix.
%
  title = 'SWEET3';
  n = 6;
  perturb = 0.0;
  a = sweet3 ( perturb );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  SWEET4 matrix.
%
  title = 'SWEET4';
  n = 13;
  perturb = 0.0;
  a = sweet4 ( perturb );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,           determ2, norm_frobenius );
%
%  SYLVESTER matrix.
%
  title = 'SYLVESTER';
  n = 5;
  seed = 123456789;
  x_n = 3 + 1;
  [ x, seed ] = r8vec_uniform_01 ( x_n, seed );
  x(1:x_n) = round ( 50.0 * x(1:x_n) - 25.0 ) / 5.0;
  y_n = 2 + 1;
  [ y, seed ] = r8vec_uniform_01 ( y_n, seed );
  y(1:y_n) = round ( 50.0 * y(1:y_n) - 25.0 ) / 5.0;
  a = sylvester ( n, x_n - 1, x, y_n - 1, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  SYMM_RANDOM matrix.
%
  title = 'SYMM_RANDOM';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  [ a, seed ] = symm_random ( n, x, seed );
  determ1 = symm_random_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  TOEPLITZ matrix.
%
  title = 'TOEPLITZ';
  n = 5;
  seed = 123456789;
  x_n = 2 * n - 1;
  [ x, seed ] = r8vec_uniform_01 ( x_n, seed );
  x(1:x_n) = round ( 50.0 * x(1:x_n) - 25.0 ) / 5.0;
  a = toeplitz ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TOEPLITZ_5DIAG matrix.
%
  title = 'TOEPLITZ_5DIAG';
  n = 5;
  seed = 123456789;
  [ d1, seed ] = r8_uniform_01 ( seed );
  d1 = round ( 50.0 * d1 - 25.0 ) / 5.0;
  [ d2, seed ] = r8_uniform_01 ( seed );
  d2 = round ( 50.0 * d2 - 25.0 ) / 5.0;
  [ d3, seed ] = r8_uniform_01 ( seed );
  d3 = round ( 50.0 * d3 - 25.0 ) / 5.0;
  [ d4, seed ] = r8_uniform_01 ( seed );
  d4 = round ( 50.0 * d4 - 25.0 ) / 5.0;
  [ d5, seed ] = r8_uniform_01 ( seed );
  d5 = round ( 50.0 * d5 - 25.0 ) / 5.0;
  a = toeplitz_5diag ( n, d1, d2, d3, d4, d5 );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TOEPLITZ_5S matrix.
%
  title = 'TOEPLITZ_5S';
  row_num = 5;
  col_num = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta - 25.0 ) / 5.0;
  [ gamma, seed ] = r8_uniform_01 ( seed );
  gamma = round ( 50.0 * gamma - 25.0 ) / 5.0;
  [ n, a ] = toeplitz_5s ( row_num, col_num, alpha, beta, gamma );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TOEPLITZ_PDS matrix.
%
  title = 'TOEPLITZ_PDS';
  m = 3;
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( m, seed );
  [ y, seed ] = r8vec_uniform_01 ( m, seed );
  y_sum = sum ( y(1:m) );
  y(1:m) = y(1:m) / y_sum;
  a = toeplitz_pds ( m, n, x, y );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TOURNAMENT_RANDOM matrix.
%
  title = 'TOURNAMENT_RANDOM';
  n = 5;
  seed_save = 123456789;
  seed = seed_save;
  [ a, seed ] = tournament_random ( n, seed );
  seed = seed_save;
  [ determ1, seed ] = tournament_random_determinant ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  TRANSITION_RANDOM matrix.
%
  title = 'TRANSITION_RANDOM';
  n = 5;
  seed = 123456789;
  [ a, seed ] = transition_random ( n, seed );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TRENCH matrix.
%
  title = 'TRENCH';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = trench ( alpha, n, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  TRI_UPPER matrix.
%
  title = 'TRI_UPPER';
  n = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = tri_upper ( alpha, n );
  determ1 = tri_upper_determinant ( alpha, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  TRIS matrix.
%
  title = 'TRIS';
  n = 5;
  seed = 123456789;
  [ d1, seed ] = r8_uniform_01 ( seed );
  d1 = round ( 50.0 * d1 - 25.0 ) / 5.0;
  [ d2, seed ] = r8_uniform_01 ( seed );
  d2 = round ( 50.0 * d2 - 25.0 ) / 5.0;
  [ d3, seed ] = r8_uniform_01 ( seed );
  d3 = round ( 50.0 * d3 - 25.0 ) / 5.0;
  a = tris ( n, n, d1, d2, d3 );
  determ1 = tris_determinant ( n, d1, d2, d3 );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = triv_determinant ( n, x, y, z );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
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
  determ1 = triw_determinant ( alpha, k, n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  UPSHIFT matrix.
%
  title = 'UPSHIFT';
  n = 5;
  a = upshift ( n );
  determ1 = upshift_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  VAND1 matrix.
%
  title = 'VAND1';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = vand1 ( n, x );
  determ1 = vand1_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  VAND2 matrix.
%
  title = 'VAND2';
  n = 5;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_01 ( n, seed );
  x(1:n) = round ( 50.0 * x(1:n) - 25.0 ) / 5.0;
  a = vand2 ( n, x );
  determ1 = vand2_determinant ( n, x );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WATHEN matrix.
%
  title = 'WATHEN';
  row_num = 5;
  col_num = 5;
  [ n, a ] = wathen ( row_num, col_num );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  WILK03 matrix.
%
  title = 'WILK03';
  n = 3;
  a = wilk03 ( );
  determ1 = wilk03_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WILK04 matrix.
%
  title = 'WILK04';
  n = 4;
  a = wilk04 ( );
  determ1 = wilk04_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WILK05 matrix.
%
  title = 'WILK05';
  n = 5;
  a = wilk05 ( );
  determ1 = wilk05_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WILK12 matrix.
%
  title = 'WILK12';
  n = 12;
  a = wilk12 ( );
  determ1 = wilk12_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WILK20 matrix.
%
  title = 'WILK20';
  n = 20;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha - 25.0 ) / 5.0;
  a = wilk20 ( alpha );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );
%
%  WILK21 matrix.
%
  title = 'WILK21';
  n = 21;
  a = wilk21 ( n );
  determ1 = wilk21_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  WILSON matrix.
%
  title = 'WILSON';
  n = 4;
  a = wilson ( );
  determ1 = wilson_determinant ( );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ZERO matrix.
%
  title = 'ZERO';
  n = 5;
  a = zero ( n, n );
  determ1 = zero_determinant ( n );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %14g  %14g  %10.2g\n', ...
    title, n, determ1, determ2, norm_frobenius );
%
%  ZIELKE matrix.
%
  title = 'ZIELKE';
  n = 5;
  seed = 123456789;
  [ d1, seed ] = r8_uniform_01 ( seed );
  d1 = round ( 50.0 * d1 - 25.0 ) / 5.0;
  [ d2, seed ] = r8_uniform_01 ( seed );
  d2 = round ( 50.0 * d2 - 25.0 ) / 5.0;
  [ d3, seed ] = r8_uniform_01 ( seed );
  d3 = round ( 50.0 * d3 - 25.0 ) / 5.0;
  a = zielke ( n, d1, d2, d3 );
  determ2 = det ( a );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d                  %14g  %10.2g\n', ...
    title, n,          determ2, norm_frobenius );

  return
end
