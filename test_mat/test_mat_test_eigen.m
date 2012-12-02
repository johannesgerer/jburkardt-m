function test_eigen ( )

%*****************************************************************************80
%
%% TEST_EIGEN tests the eigenvalue computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_EIGEN\n' );
  fprintf ( 1, '  Compute the Frobenius norm of the eigenvalue error:\n' );
  fprintf ( 1, '    A * X - X * LAMBDA\n' );
  fprintf ( 1, '  given a set of K eigenvectors X and eigenvalues LAMBDA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix title             N     K      ||A||          ||(A-Lambda*I)*X||\n' );
  fprintf ( 1, '\n' );
%
%  BODEWIG matrix.
%
  title = 'BODEWIG';
  n = 4;
  k = 4;
  a = bodewig ( );
  lambda = bodewig_eigenvalues ( );
  x = bodewig_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  CARRY matrix.
%
  title = 'CARRY';
  n = 5;
  k = 5;
  seed = 123456789;
  [ i1, seed ] = i4_uniform ( 2, 20, seed );
  a = carry ( i1, n );
  lambda = carry_eigenvalues ( i1, n );
  x = carry_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  CHOW matrix.
%
  title = 'CHOW';
  n = 5;
  k = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = chow ( alpha, beta, n, n );
  lambda = chow_eigenvalues ( alpha, beta, n );
  x = chow_right ( alpha, beta, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  COMBIN matrix.
%
  title = 'COMBIN';
  n = 5;
  k = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  [ beta, seed ] = r8_uniform_01 ( seed );
  beta = round ( 50.0 * beta ) / 5.0;
  a = combin ( alpha, beta, n );
  lambda = combin_eigenvalues ( alpha, beta, n );
  x = combin_right ( alpha, beta, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  DIF2 matrix.
%
  title = 'DIF2';
  n = 5;
  k = 5;
  a = dif2 ( n, n );
  lambda = dif2_eigenvalues ( n );
  x = dif2_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  EXCHANGE matrix.
%
  title = 'EXCHANGE';
  n = 5;
  k = 5;
  a = exchange ( n, n );
  lambda = exchange_eigenvalues ( n );
  x = exchange_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  IDEM_RANDOM matrix.
%
  title = 'IDEM_RANDOM';
  n = 5;
  k = 5;
  rank = 3;
  seed_save = 987654321;
  seed = seed_save;
  [ a, seed ] = idem_random ( n, rank, seed );
  lambda = idem_random_eigenvalues ( n, rank );
  seed = seed_save;
  [ x, seed ] = idem_random_right ( n, rank, seed );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  IDENTITY matrix.
%
  title = 'IDENTITY';
  n = 5;
  k = 5;
  a = identity ( n, n );
  lambda = identity_eigenvalues ( n );
  x = identity_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ILL3 matrix.
%
  title = 'ILL3';
  n = 3;
  k = 3;
  a = ill3 ( );
  lambda = ill3_eigenvalues ( );
  x = ill3_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  KMS matrix.
%
  title = 'KMS';
  n = 5;
  k = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  a = kms ( alpha, n, n );
  lambda = kms_eigenvalues ( alpha, n );
  x = kms_right ( alpha, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ONE matrix.
%
  title = 'ONE';
  n = 5;
  k = 5;
  a = one ( n, n );
  lambda = one_eigenvalues ( n );
  x = one_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ORTEGA matrix.
%
  title = 'ORTEGA';
  n = 5;
  k = 5;
  seed = 123456789;
  [ v1, seed ] = r8vec_uniform_01 ( n, seed );
  v1(1:n) = round ( 50.0 * v1(1:n) - 25.0 ) / 5.0;
  [ v2, seed ] = r8vec_uniform_01 ( n, seed );
  v2(1:n) = round ( 50.0 * v2(1:n) - 25.0 ) / 5.0;
  [ v3, seed ] = r8vec_uniform_01 ( n, seed );
  v3(1:n) = round ( 50.0 * v3(1:n) - 25.0 ) / 5.0;
  a = ortega ( n, v1, v2, v3 );
  lambda = ortega_eigenvalues ( n, v1, v2, v3 );
  x = ortega_right ( n, v1, v2, v3 );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  OTO matrix.
%
  title = 'OTO';
  n = 5;
  k = 5;
  a = oto ( n, n );
  lambda = oto_eigenvalues ( n );
  x = oto_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );;
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  PDS_RANDOM matrix.
%
  title = 'PDS_RANDOM';
  n = 5;
  k = 5;
  seed_save = 123456789;
  seed = seed_save;
  a = pds_random ( n, seed );
  seed = seed_save;
  lambda = pds_random_eigenvalues ( n, seed );
  seed = seed_save;
  x = pds_random_right ( n, seed );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );;
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  PEI matrix.
%
  title = 'PEI';
  n = 5;
  k = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = pei ( alpha, n );
  lambda = pei_eigenvalues ( alpha, n );
  x = pei_right ( alpha, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RODMAN matrix.
%
  title = 'RODMAN';
  n = 5;
  k = 5;
  seed = 123456789;
  [ alpha, seed ] = r8_uniform_01 ( seed );
  alpha = round ( 50.0 * alpha ) / 5.0;
  a = rodman ( alpha, n, n );
  lambda = rodman_eigenvalues ( alpha, n );
  x = rodman_right ( alpha, n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ROSSER1 matrix.
%
  title = 'ROSSER1';
  n = 8;
  k = 8;
  a = rosser1 ( );
  lambda = rosser1_eigenvalues ( );
  x = rosser1_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS1 matrix.
%
  title = 'RUTIS1';
  n = 4;
  k = 4;
  a = rutis1 ( );
  lambda = rutis1_eigenvalues ( );
  x = rutis1_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS2 matrix.
%
  title = 'RUTIS2';
  n = 4;
  k = 4;
  a = rutis2 ( );
  lambda = rutis2_eigenvalues ( );
  x = rutis2_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  RUTIS3 matrix.
%  COMPLEX eigenvalues.
%
  if ( 0 )
    title = 'RUTIS3';
    n = 4;
    k = 4;
    a = rutis3 ( );
    lambda = rutis3_eigenvalues ( );
    x = rutis3_right ( );
    error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
    norm_frobenius = r8mat_norm_fro ( n, n, a );
    fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
  end
%
%  RUTIS5 matrix.
%
  title = 'RUTIS5';
  n = 4;
  k = 4;
  a = rutis5 ( );
  lambda = rutis5_eigenvalues ( );
  x = rutis5_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  WILK12 matrix.
%
  title = 'WILK12';
  n = 12;
  k = 12;
  a = wilk12 ( );
  lambda = wilk12_eigenvalues ( );
  x = wilk12_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  WILSON matrix.
%
  title = 'WILSON';
  n = 4;
  k = 4;
  a = wilson ( );
  lambda = wilson_eigenvalues ( );
  x = wilson_right ( );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  ZERO matrix.
%
  title = 'ZERO';
  n = 5;
  k = 5;
  a = zero ( n, n );
  lambda = zero_eigenvalues ( n );
  x = zero_right ( n );
  error_frobenius = r8mat_is_eigen_right ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '%20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );

  return
end
