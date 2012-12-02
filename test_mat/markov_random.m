function [ a, seed ] = markov_random ( n, seed )

%*****************************************************************************80
%
%% MARKOV_RANDOM returns a random Markov matrix.
%
%  Discussion:
%
%    A Markov matrix, also called a "stochastic" matrix, is distinguished
%    by two properties:
%
%    * All matrix entries are nonnegative;
%    * The sum of the entries in each row is 1.
%
%    A "transition matrix" is the transpose of a Markov matrix, and
%    has column sums equal to 1.
%
%  Example:
%
%    N = 4
%
%    1/10  2/10  3/10  4/10
%    1     0     0     0
%    5/10  2/10  3/10  0
%    2/10  2/10  2/10  4/10
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    0 <= A(I,J) <= 1.0 for every I and J.
%
%    The sum of the entries in each row of A is 1.
%
%    Because it has a constant row sum of 1,
%    A has an eigenvalue of 1, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    All the eigenvalues of A have modulus no greater than 1.
%
%    The eigenvalue 1 lies on the boundary of all the Gerschgorin rowsum disks.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
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

  for i = 1 : n

    row_sum = sum ( a(i,1:n) );

    a(i,1:n) = a(i,1:n) / row_sum;

  end

  return
end
