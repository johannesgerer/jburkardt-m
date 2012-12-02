function test_eigen_test01 ( )

%*****************************************************************************80
%
%% TEST_EIGEN_TEST01 tests R8SYMM_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2012
%
%  Author:
%
%    John Burkardt
%
  n = 100;
  bin_num = 10;
  lambda_dev = 1.0;
  lambda_mean = 1.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_EIGEN_TEST01\n' );
  fprintf ( 1, '  R8SYMM_TEST makes an arbitrary size symmetric matrix\n' );
  fprintf ( 1, '  with known eigenvalues and eigenvectors.\n' );

  [ a, q, lambda, seed ] = r8symm_test ( n, lambda_mean, lambda_dev, seed );
%
%  Get the eigenvalue range.
%
  lambda_min = min ( lambda(1:n) );
  lambda_max = max ( lambda(1:n) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAMBDA_MIN = %g\n', lambda_min );
  fprintf ( 1, '  LAMBDA_MAX = %g\n', lambda_max );
%
%  Bin the eigenvalues.
%
  [ bin, bin_limit ] = r8vec_bin ( n, lambda, bin_num, lambda_min, lambda_max );

  r8bin_print ( bin_num, bin, bin_limit, '  Lambda bins:' );

  if ( 0 )
    r8mat_print ( n, n, a, '  The matrix A:' );
  end

  if ( 0 )
    r8mat_print ( n, n, q, '  The eigenvector matrix Q:' );
  end

  aq = a * q;

  for j = 1 : n
    lambda2(j) = norm ( aq(1:n,j) );
  end

  r8vec2_print ( n, lambda, lambda2, '  LAMBDA versus column norms of A*Q:' );

  return
end
