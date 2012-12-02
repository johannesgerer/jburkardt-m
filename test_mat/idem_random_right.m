function [ x, seed ] = idem_random_right ( n, rank, seed )

%*****************************************************************************80
%
%% IDEM_RANDOM_RIGHT returns the right eigenvectors of the IDEM_RANDOM matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
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
%    Input, integer N, the order of the matrix.
%
%    Input, integer RANK, the rank of A.
%    0 <= RANK <= N.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real X(N,N), the matrix.
%
  [ x, seed ] = orth_random ( n, seed );

  x = x';

  return
end
