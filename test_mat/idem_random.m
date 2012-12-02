function [ a, seed ] = idem_random ( n, rank, seed )

%*****************************************************************************80
%
%% IDEM_RANDOM returns a random idempotent matrix of rank K.
%
%  Properties:
%
%    A is idempotent: A * A = A
%
%    If A is invertible, then A must be the identity matrix.
%    In other words, unless A is the identity matrix, it is singular.
%
%    I - A is also idempotent.
%
%    All eigenvalues of A are either 0 or 1.
%
%    rank(A) = trace(A)
%
%    A is a projector matrix.
%
%    The matrix I - 2A is involutory, that is ( I - 2A ) * ( I - 2A ) = I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alston Householder, John Carpenter,
%    The singular values of involutory and of idempotent matrices,
%    Numerische Mathematik,
%    Volume 5, 1963, pages 234-237.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer RANK, the rank of A.
%    0 <= RANK <= N.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real A(N,N), the matrix.
%
  if ( rank < 0 | n < rank )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'IDEM_RANDOM - Fatal error!\n' );
    fprintf ( 1, '  RANK must be between 0 and N.\n' );
    fprintf ( 1, '  Input value = %d\n', rank );
    error ( 'IDEM_RANDOM - Fatal error!' );
  end
%
%  Get a random orthogonal matrix Q.
%
  [ q, seed ] = orth_random ( n, seed );
%
%  Compute Q' * D * Q, where D is the diagonal eigenvalue matrix
%  of RANK 1's followed by N-RANK 0's.
%
  for i = 1 : n
    for j = 1 : n
      a(i,j) =  q(1:rank,i)' * q(1:rank,j);
    end
  end

  return
end
