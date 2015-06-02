function a = pds_random ( n, key )

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
%    17 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real A(N,N), the matrix.
%

%
%  Get a random set of eigenvalues.
%
  seed = key;
  [ lambda, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Get a random orthogonal matrix Q.
%
  q = orth_random ( n, key );
%
%  Set A = Q * Lambda * Q'.
%
  a = zeros ( n, n );

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
