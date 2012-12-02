function a = legendre ( n )

%*****************************************************************************80
%
%% LEGENDRE returns the Legendre polynomial matrix.
%
%  Example:
%
%    N = 11
%
%     1    .     .     .      .     .      .      .       .     .     . / 1
%     .    1     .     .      .     .      .      .       .     .     . / 1
%    -1    .     3     .      .     .      .      .       .     .     . / 2
%     .   -3     .     5      .     .      .      .       .     .     . / 2
%     3    .   -30     .     35     .      .      .       .     .     . / 8
%     .   15     .   -70      .    63      .      .       .     .     . / 8
%    -5    .   105     .   -315     .    231      .       .     .     . / 16
%     .  -35     .   315      .  -693      .    429       .     .     . / 16
%    35    . -1260     .   6930     . -12012      .    6435     .     . / 128
%     .  315     . -4620      . 18018      . -25740       . 12155     . / 128
%   -63    .  3465     . -30030     .  90090      . -109395     . 46189 / 256
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is lower triangular.
%
%    The elements of each row sum to 1.
%
%    Because it has a constant row sum of 1,
%    A has an eigenvalue of 1, and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A is reducible.
%
%    The diagonals form a pattern of zero, positive, zero, negative.
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
        a(i,j) = - ( i - 2 ) * a(i-2,j) ...
                 / ( i - 1 );
      else
        a(i,j) = ( ( 2 * i - 3 ) * a(i-1,j-1) ...
                 + (   - i + 2 ) * a(i-2,j) ) ...
                 / (     i - 1 );
      end
    end
  end

  return
end
