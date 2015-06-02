function a = legendre_inverse ( n )

%*****************************************************************************80
%
%% LEGENDRE_INVERSE returns the inverse of the LEGENDRE matrix.
%
%  Example:
%
%    N = 11
%
%       1    .     .    .     .    .    .   .    .   .   .
%       .    1     .    .     .    .    .   .    .   .   .
%       1    .     2    .     .    .    .   .    .   .   . /     3
%       .    3     .    2     .    .    .   .    .   .   . /     5
%       7    .    20    .     8    .    .   .    .   .   . /    35
%       .   27     .   28     .    8    .   .    .   .   . /    63
%      33    .   110    .    72    .   16   .    .   .   . /   231
%       .  143     .  182     .   88    .  16    .   .   . /   429
%     715    .  2600    .  2160    .  832   .  128   .   . /  6435
%       . 3315     . 4760     . 2992    . 960    . 128   . / 12155
%    4199    . 16150    . 15504    . 7904   . 2176   . 256 / 46189
%
%  Properties:
%
%    A is nonnegative.
%
%    The elements of each row sum to 1.
%
%    Because it has a constant row sum of 1,
%    A has an eigenvalue of 1, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A is lower triangular.
%
%    A is reducible.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
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

        a(i,j) = (     j     ) * a(i-1,j+1) / ( 2 * j + 1 );

      elseif ( j < n )

        a(i,j) = (     j - 1 ) * a(i-1,j-1) / ( 2 * j - 3 ) ...
               + (     j     ) * a(i-1,j+1) / ( 2 * j + 1 );

      else

        a(i,j) = (     j - 1 ) * a(i-1,j-1) / ( 2 * j - 3 );

      end
    end
  end

  return
end
