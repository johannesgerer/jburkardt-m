function [ a, q, lambda, seed ] = r8symm_test ( n, lambda_mean, lambda_dev, ...
  seed )

%*****************************************************************************80
%
%% R8SYMM_TEST determines a symmetric matrix with a certain eigenstructure.
%
%  Discussion:
%
%    An R8SYMM is a real symmetric matrix stored using full storage, and
%    using R8 arithmetic.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real LAMBDA_MEAN, the mean value of the normal
%    distribution from which the eigenvalues will be chosen.
%
%    Input, real LAMBDA_DEV, the standard deviation of the normal
%    distribution from which the eigenvalues will be chosen.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real A(N,N), the test matrix.
%
%    Output, real Q(N,N), the eigenvector matrix.
%
%    Output, real LAMBDA(N), the eigenvalue vector.
%
 
%
%  Choose the eigenvalues LAMBDA.
%
  [ lambda, seed ] = r8vec_normal ( n, lambda_mean, lambda_dev, seed );
%
%  Get a random orthogonal matrix Q.
%
  [ q, seed ] = r8mat_orth_uniform ( n, seed );
%
%  Set A = Q * Lambda*I * Q'.
%
  a = q * diag ( lambda ) * q';

  return
end
