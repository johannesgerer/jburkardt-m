function a = bimarkov_random ( n, key )

%*****************************************************************************80
%
%% BIMARKOV_RANDOM returns the BIMARKOV_RANDOM matrix.
%
%  Discussion:
%
%    This is a random biMarkov or doubly stochastic matrix.
%
%  Example:
%
%    N = 5
%
%    1/5   1/5   1/5   1/5   1/5
%    1/2   1/2    0     0     0
%    1/6   1/6   2/3    0     0
%    1/12  1/12  1/12  3/4    0
%    1/20  1/20  1/20  1/20  4/5
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    0 <= A(I,J) <= 1.0 for every I and J.
%
%    A has constant row sum 1.
%
%    A has constant column sum 1.
%
%    All the eigenvalues of A have modulus 1.
%
%    1 is always an eigenvalue of A, with eigenvector (1,1,...,1).
%
%    The eigenvalue 1 lies on the boundary of all the Gershgorin
%    row or column sum disks.
%
%    Every doubly stochastic matrix is a combination
%      A = w1 * P1 + w2 * P2 + ... + wk * Pk
%    of permutation matrices, with positive weights w that sum to 1.
%    (Birkhoff's theorem, see Horn and Johnson.)
%
%    A is a Markov matrix.
%
%    A is a transition matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Roger Horn, Charles Johnson,
%    Matrix Analysis,
%    Cambridge, 1985.
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
%  Get a random orthogonal matrix.
%
  a = orth_random ( n, key );
%
%  Square each entry.
%
  a(1:n,1:n) = a(1:n,1:n).^2;

  return
end