function x = idem_random_eigen_right ( n, rank, key )

%*****************************************************************************80
%
%% IDEM_RANDOM_EIGEN_RIGHT returns the right eigenvectors of the IDEM_RANDOM matrix.
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
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, real X(N,N), the matrix.
%
  x = orth_random ( n, key );

  x = x';

  return
end
