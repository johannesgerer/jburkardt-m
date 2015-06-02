function a = dif1cyclic ( n )

%*****************************************************************************80
%
%% DIF1CYCLIC returns the DIF1CYCLIC matrix.
%
%  Example:
%
%    N = 5
%
%    0 +1  .  . -1
%   -1  0 +1  .  .
%    . -1  0 +1  .
%    .  . -1  0 +1
%   +1  .  . -1  0
%
%  Square Properties:
%
%    A is integral: int ( A ) = A.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is antisymmetric: A' = -A.
%
%    Because A is antisymmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A has constant row sum = 0.
%
%    A has constant column sum = 0.
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
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n

    im1 = i4_wrap ( i-1, 1, n );
    a(i,im1) = -1.0;

    ip1 = i4_wrap ( i+1, 1, n );
    a(i,ip1) = +1.0;

  end

  return
end
