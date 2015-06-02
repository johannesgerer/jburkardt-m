function test_eigen_left ( )

%*****************************************************************************80
%
%% TEST_EIGEN_LEFT tests left eigensystems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_EIGEN_LEFT\n' );
  fprintf ( 1, '  Compute the Frobenius norm of the left eigensystem error:\n' );
  fprintf ( 1, '    X*A * LAMBDA*X\n' );
  fprintf ( 1, '  given K left eigenvectors X and eigenvalues LAMBDA.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Title                    N     K      ||A||          ' );
  fprintf ( 1, '||X*A-Lambda*X||\n' );
  fprintf ( 1, '\n' );
%
%  A123
%
  title = 'A123';
  n = 3;
  k = 3;
  a = a123 ( );
  lambda = a123_eigenvalues ( );
  x = a123_eigen_left ( );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
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
  x = carry_eigen_left ( n, i1 );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
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
  x = chow_eigen_left ( alpha, beta, n );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );
%
%  DIAGONAL
%
  title = 'DIAGONAL';
  n = 5;
  k = 5;
  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  [ d, seed ] = r8vec_uniform_ab ( n, r8_lo, r8_hi, seed );
  a = diagonal ( n, n, d );
  lambda = diagonal_eigenvalues ( n, d );
  x = diagonal_eigen_left ( n, d );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
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
  x = rosser1_eigen_left ( );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
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
  x = symm_random_eigen_left ( n, d, key );
  error_frobenius = r8mat_is_eigen_left ( n, k, a, x, lambda );
  norm_frobenius = r8mat_norm_fro ( n, n, a );
  fprintf ( 1, '  %-20s  %4d  %4d  %14g  %14g\n', ...
    title, n, k, norm_frobenius, error_frobenius );

  return
end
