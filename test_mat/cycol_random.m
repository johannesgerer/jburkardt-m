function [ a, seed ] = cycol_random ( m, n, k, seed )

%*****************************************************************************80
%
%% CYCOL_RANDOM returns the K-cyclical column matrix.
%
%  Definition:
%
%    A K-cyclical column matrix has the property that the first K columns
%    of the matrix are repeated.  Thus,
%
%      A(I,J) = arbitrary, for J <= K.
%      A(I,J+L*K) = A(I,J) for L = 2, 3, ...
%
%  Example:
%
%    K = 2, M = 4, N = 5
%
%    0.1  0.2  0.1  0.2  0.1
%    0.3  0.4  0.3  0.4  0.3
%    0.7  0.2  0.7  0.2  0.7
%    0.1  0.8  0.1  0.8  0.1
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A has rank at most K.
%
%    A can lead to underflow problems for Gauss elimination.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    NA Digest,
%    Volume 89, Issue 3, January 22, 1989.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, integer K, the number of distinct columns to form.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(M,N), the matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ a, seed ] = r8mat_uniform_01 ( m, k, seed );

  for j = k+1 : n
    jj = mod ( j-1, k ) + 1;
    a(1:m,j) = a(1:m,jj);
  end

  return
end
