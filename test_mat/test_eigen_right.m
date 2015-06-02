function test_eigen_right ( )

%*****************************************************************************80
%
%% TEST_EIGEN_RIGHT tests right eigensystems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_EIGEN_RIGHT\n' );
  fprintf ( 1, '  Compute the Frobenius norm of the right eigensystem error:\n' );
  fprintf ( 1, '    A * X - X * LAMBDA\n' );
  fprintf ( 1, '  given K right eigenvectors X and eigenvalues LAMBDA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    N     K      ||A||          ' );
  fprintf ( 1, '||A*X-X*Lambda||\n' );
  fprintf ( 1, '\n' );
%
%  A123
%
  title = 'A123';
  n = 3;
  k = 3;
  a = a123 ( );
  lambda = a123_eigenvalues ( );
  x = a123_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  BAB
%
  title = 'BAB';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = bab ( n, alpha, beta );
  lambda = bab_eigenvalues ( n, alpha, beta );
  x = bab_eigen_right ( n, alpha, beta );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  BODEWIG
%
  title = 'BODEWIG';
  n = 4;
  k = 4;
  a = bodewig ( );
  lambda = bodewig_eigenvalues ( );
  x = bodewig_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  CARRY
%
  title = 'CARRY';
  n = 5;
  k = 5;
  i4_lo = 2;
  i4_hi = 20;
  seed = 123456789;
  [ i1, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
  a = carry ( n, i1 );
  lambda = carry_eigenvalues ( n, i1 );
  x = carry_eigen_right ( n, i1 );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  CHOW
%
  title = 'CHOW';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = chow ( alpha, beta, n, n );
  lambda = chow_eigenvalues ( alpha, beta, n );
  x = chow_eigen_right ( alpha, beta, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  COMBIN
%
  title = 'COMBIN';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  [ beta, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = combin ( alpha, beta, n );
  lambda = combin_eigenvalues ( alpha, beta, n );
  x = combin_eigen_right ( alpha, beta, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  DIF2
%
  title = 'DIF2';
  n = 5;
  k = 5;
  a = dif2 ( n, n );
  lambda = dif2_eigenvalues ( n );
  x = dif2_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  EXCHANGE
%
  title = 'EXCHANGE';
  n = 5;
  k = 5;
  a = exchange ( n, n );
  lambda = exchange_eigenvalues ( n );
  x = exchange_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  IDEM_RANDOM
%
  title = 'IDEM_RANDOM';
  n = 5;
  k = 5;
  rank = 3;
  key = 123456789;
  a = idem_random ( n, rank, key );
  lambda = idem_random_eigenvalues ( n, rank, key );
  x = idem_random_eigen_right ( n, rank, key );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  IDENTITY
%
  title = 'IDENTITY';
  n = 5;
  k = 5;
  a = identity ( n, n );
  lambda = identity_eigenvalues ( n );
  x = identity_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ILL3
%
  title = 'ILL3';
  n = 3;
  k = 3;
  a = ill3 ( );
  lambda = ill3_eigenvalues ( );
  x = ill3_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  KERSHAW
%
  title = 'KERSHAW';
  n = 4;
  k = 4;
  a = kershaw ( );
  lambda = kershaw_eigenvalues ( );
  x = kershaw_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  KMS matrix
%  Eigenvalue information requires 0 <= ALPHA <= 1.
%
  title = 'KMS';
  n = 5;
  k = 5;
  r8_lo = +0.0;
  r8_hi = +1.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = kms ( alpha, n, n );
  lambda = kms_eigenvalues ( alpha, n );
  x = kms_eigen_right ( alpha, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  LINE_ADJ
%
  title = 'LINE_ADJ';
  n = 5;
  k = 5;
  a = line_adj ( n );
  lambda = line_adj_eigenvalues ( n );
  x = line_adj_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  LINE_LOOP_ADJ
%
  title = 'LINE_LOOP_ADJ';
  n = 5;
  k = 5;
  a = line_loop_adj ( n );
  lambda = line_loop_adj_eigenvalues ( n );
  x = line_loop_adj_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ONE
%
  title = 'ONE';
  n = 5;
  k = 5;
  a = one ( n, n );
  lambda = one_eigenvalues ( n );
  x = one_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ORTEGA
%
  title = 'ORTEGA';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ v1, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ v2, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  [ v3, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = ortega ( n, v1, v2, v3 );
  lambda = ortega_eigenvalues ( n, v1, v2, v3 );
  x = ortega_eigen_right ( n, v1, v2, v3 );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  OTO
%
  title = 'OTO';
  n = 5;
  k = 5;
  a = oto ( n, n );
  lambda = oto_eigenvalues ( n );
  x = oto_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );;
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  PDS_RANDOM
%
  title = 'PDS_RANDOM';
  n = 5;
  k = 5;
  key = 123456789;
  a = pds_random ( n, key );
  lambda = pds_random_eigenvalues ( n, key );
  x = pds_random_eigen_right ( n, key );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );;
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  PEI
%
  title = 'PEI';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = pei ( alpha, n );
  lambda = pei_eigenvalues ( alpha, n );
  x = pei_eigen_right ( alpha, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RODMAN
%
  title = 'RODMAN';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
  a = rodman ( n, n, alpha );
  lambda = rodman_eigenvalues ( n, alpha );
  x = rodman_eigen_right ( n, alpha );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ROSSER1
%
  title = 'ROSSER1';
  n = 8;
  k = 8;
  a = rosser1 ( );
  lambda = rosser1_eigenvalues ( );
  x = rosser1_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS1
%
  title = 'RUTIS1';
  n = 4;
  k = 4;
  a = rutis1 ( );
  lambda = rutis1_eigenvalues ( );
  x = rutis1_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS2
%
  title = 'RUTIS2';
  n = 4;
  k = 4;
  a = rutis2 ( );
  lambda = rutis2_eigenvalues ( );
  x = rutis2_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS3
%  COMPLEX eigenvalues.
%
  if ( 0 )
    title = 'RUTIS3';
    n = 4;
    k = 4;
    a = rutis3 ( );
    lambda = rutis3_eigenvalues ( );
    x = rutis3_eigen_right ( );
    error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
  end
%
%  RUTIS5
%
  title = 'RUTIS5';
  n = 4;
  k = 4;
  a = rutis5 ( );
  lambda = rutis5_eigenvalues ( );
  x = rutis5_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  SYLVESTER_KAC
%
  title = 'SYLVESTER_KAC';
  n = 5;
  k = 5;
  a = sylvester_kac ( n );
  lambda = sylvester_kac_eigenvalues ( n );
  x = sylvester_kac_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  SYMM_RANDOM
%
  title = 'SYMM_RANDOM';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ d, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  key = 123456789;
  a = symm_random ( n, d, key );
  lambda = symm_random_eigenvalues ( n, d, key );
  x = symm_random_eigen_right ( n, d, key );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  WILK12
%
  title = 'WILK12';
  n = 12;
  k = 12;
  a = wilk12 ( );
  lambda = wilk12_eigenvalues ( );
  x = wilk12_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  WILSON
%
  title = 'WILSON';
  n = 4;
  k = 4;
  a = wilson ( );
  lambda = wilson_eigenvalues ( );
  x = wilson_eigen_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ZERO
%
  title = 'ZERO';
  n = 5;
  k = 5;
  a = zero ( n, n );
  lambda = zero_eigenvalues ( n );
  x = zero_eigen_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );

  return
end
