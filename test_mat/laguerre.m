function a = laguerre ( n )

%*****************************************************************************80
%
%% LAGUERRE returns the Laguerre polynomial matrix.
%
%  Example:
%
%    N = 8
%
%      1      .     .      .    .    .    .    .
%      1     -1     .      .    .    .    .    .
%      2     -4     1      .    .    .    .    .   /    2
%      6    -18     9     -1    .    .    .    .   /    6
%     24    -96    72    -16    1    .    .    .   /   24
%    120   -600   600   -200   25   -1    .    .   /  120
%    720  -4320  5400  -2400  450  -36    1    .   /  720
%   5040 -35280 52920 -29400 7350 -882   49   -1   / 5040
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is lower triangular.
%
%    The columns of A alternate in sign.
%
%    A(I,1) = 1
%    A(I,I) = (-1)**(I-1) / (I-1)!.
%
%    LAMBDA(I) = (-1)**(I-1) / (I-1)!.
%
%    det ( A ) = product ( 1 <= I <= N ) (-1)**(I-1) / (I-1)!
%
%    The I-th row contains the coefficients of the Laguerre
%    polynomial of degree I-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
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

  a(2,1) = 1.0;
  a(2,2) = -1.0;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = (  ( 2 * i - 3 ) * a(i-1,j) ...
                 +  (   - i + 2 ) * a(i-2,j) ) ...
                 /  (     i - 1 );
      else
        a(i,j) = (  ( 2 * i - 3 ) * a(i-1,j) ...
                 -  (         1 ) * a(i-1,j-1) ...
                 +  (   - i + 2 ) * a(i-2,j) ) ...
                 /  (     i - 1 );
      end
    end
  end

  return
end
