function [ a, seed ] = transition_random ( n, seed )

%*****************************************************************************80
%
%% TRANSITION_RANDOM returns a random transition matrix.
%
%  Discussion:
%
%    A transition matrix is distinguished by two properties:
%
%    * All matrix entries are nonnegative;
%    * The sum of the entries in each column is 1.
%
%  Example:
%
%    N = 4
%
%    1/10  1  5/10  2/10  2/10
%    2/10  0  2/10  2/10  2/10
%    3/10  0  3/10  2/10  2/10
%    4/10  0  0/10  4/10  4/10
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonnegative.
%
%    0 <= A(I,J) <= 1.0 for every I and J.
%
%    The sum of the entries in each column of A is 1.
%
%    Because A has a constant column sum of 1,
%    it has an eigenvalue of 1,
%    and it has a left eigenvector of (1,1,1,...,1).
%
%    All the eigenvalues of A have modulus no greater than 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real A(N,N), the matrix.
%
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );

  for j = 1 : n

    col_sum = sum ( a(1:n,j) );

    a(1:n,j) = a(1:n,j) / col_sum;

  end

  return
end
