function a = hermite_inverse ( n )

%*****************************************************************************80
%
%% HERMITE_INVERSE returns the inverse of the Hermite polynomial matrix.
%
%  Example:
%
%    N = 11
%
%        1     .     .     .     .    .    .  .  . . .
%        .     1     .     .     .    .    .  .  . . .  /    2
%        2     .     1     .     .    .    .  .  . . .  /    4
%        .     6     .     1     .    .    .  .  . . .  /    8
%       12     .    12     .     1    .    .  .  . . .  /   16
%        .    60     .    20     .    1    .  .  . . .  /   32
%      120     .   180     .    30    .    1  .  . . .  /   64
%        .   840     .   420     .   42    .  1  . . .  /  128
%     1680     .  3360     .   840    .   56  .  1 . .  /  256
%        . 15120     . 10080     . 1512    . 72  . 1 .  /  512
%    30240     . 75600     . 25200    . 2520  . 90 . 1  / 1024
%
%  Properties:
%
%    A is generally not symmetric: A' ~= A.
%
%    A is nonnegative.
%
%    A is lower triangular.
%
%    det ( A ) = 1 / 2**((N*(N-1))/2)
%
%    LAMBDA(I) = 1 / 2**(I-1)
%
%    A is reducible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
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
    return
  end

  a(1:n,1:n) = 0.0;

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 0.5;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = ( ( i - 2 ) * a(i-2,j)              ) / 2.0;
      else
        a(i,j) = ( ( i - 2 ) * a(i-2,j) + a(i-1,j-1) ) / 2.0;
      end
    end
  end

  return
end
