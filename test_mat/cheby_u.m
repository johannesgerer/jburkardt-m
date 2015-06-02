function a = cheby_u ( n )

%*****************************************************************************80
%
%% CHEBY_U returns the CHEBY_U matrix.
%
%  Example:
%
%    N = 11
%
%    1  .   .    .    .    .    .     .     .   .    .
%    .  2   .    .    .    .    .     .     .   .    .
%   -1  .   4    .    .    .    .     .     .   .    .
%    . -4   .    8    .    .    .     .     .   .    .
%    1  . -12    .   16    .    .     .     .   .    .
%    .  6   .  -32    .   32    .     .     .   .    .
%   -1  .  24    .  -80    .   64     .     .   .    .
%    . -8   .   80    . -192    .   128     .   .    .
%    1  . -40    .  240    . -448     .   256   .    .
%    . 10   . -160    .  672    . -1024     . 512    .
%   -1  .  60    . -560    . 1792     . -2304   . 1024
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is generally not normal: A' * A /= A * A'.
%
%    A is lower triangular.
%
%    A is reducible.
%
%    The entries of row N sum to N.
%
%    det ( A ) = 2^((N*(N-1))/2).
%
%    LAMBDA(I) = 2^(I-1)
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  if ( n <= 0 )
    a = [];
    return
  end

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 2.0;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = - a(i-2,j);
      else
        a(i,j) = 2.0 * a(i-1,j-1) - a(i-2,j);
      end
    end
  end

  return
end
