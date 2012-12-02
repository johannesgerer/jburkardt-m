function [ a, seed ] = pds_random ( n, seed )

%*****************************************************************************80
%
%% PDS_RANDOM returns a random positive definite symmetric matrix.
%
%  Discussion:
%
%    The matrix returned will have eigenvalues in the range [0,1].
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is positive definite: 0 < x'*A*x for nonzero x.
%
%    The eigenvalues of A will be real.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real A(N,N), the matrix.
%
%    Output, integer SEED, a seed for the random 
%    number generator.
%

%
%  Get a random set of eigenvalues.
%
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Get a random orthogonal matrix Q.
%
  [ q, seed ] = orth_random ( n, seed );
%
%  Set A = Q * Lambda * Q'.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) = 0.0;
      for k = 1 : n
        a(i,j) = a(i,j) + q(i,k) * lambda(k) * q(j,k);
      end
    end
  end

  return
end
