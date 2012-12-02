function a = cheby_t ( n )

%*****************************************************************************80
%
%% CHEBY_T returns the Chebyshev T matrix.
%
%  Example:
%
%    N = 11
%
%    1  .   .    .    .    .    .    .     .   .   .
%    .  1   .    .    .    .    .    .     .   .   .
%   -1  .   2    .    .    .    .    .     .   .   .
%    . -3   .    4    .    .    .    .     .   .   .
%    1  .  -8    .    8    .    .    .     .   .   .
%    .  5   .  -20    .   16    .    .     .   .   .
%   -1  .  18    .  -48    .   32    .     .   .   .
%    . -7   .   56    . -112    .   64     .   .   .
%    1  . -32    .  160    . -256    .   128   .   .
%    .  9   . -120    .  432    . -576     . 256   .
%   -1  .  50    . -400    . 1120    . -1280   . 512
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is reducible.
%
%    A is lower triangular.
%
%    Each row of A sums to 1.
%
%    det ( A ) = 2**( (N-1) * (N-2) / 2 )
%
%    A is not normal: A' * A /= A * A'.
%
%    For I = 1:
%
%      LAMBDA(1) = 1
%
%    For 1 < I
%
%      LAMBDA(I) = 2**(I-2)
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
  if ( n <= 0 )
    a = [];
    return
  end

  a(1:n,1:n) = 0.0;

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 1.0;

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
