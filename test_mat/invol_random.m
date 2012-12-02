function [ a, seed ] = invol_random ( n, rank, seed )

%*****************************************************************************80
%
%% INVOL_RANDOM returns a random involutional matrix.
%
%  Properties:
%
%    A is nonsingular.
%
%    A is involutional: A * A = I
%
%    det ( A ) = +1 or -1.
%
%    A is unimodular.
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
%    Input, integer RANK, the rank of the idempotent matrix
%    used to generate A.  Setting RANK = 0 or N will yield
%    a multiple of the identity.  Intermediate values will give
%    more interesting results.
%
%    Input, integer SEED, a seed for the random number
%    generator.
%
%    Output, real A(N,N), the matrix.
%
%    Output, integer SEED, a seed for the random number
%    generator.
%
  [ a, seed ] = idem_random ( n, rank, seed );

  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 1.0 - 2.0 * a(i,j);
      else
        a(i,j) =     - 2.0 * a(i,j);
      end
    end
  end

  return
end
