function a = pascal2_inverse ( n )

%*****************************************************************************80
%
%% PASCAL2_INVERSE returns the inverse of the PASCAL2 matrix.
%
%  Formula:
%
%    A(I,J) = sum ( max(I,J) <= K <= N )
%      (-1)^(J+I) * COMB(K-1,I-1) * COMB(K-1,J-1)
%
%  Example:
%
%    N = 5
%
%      5 -10  10  -5   1
%    -10  30 -35  19  -4
%     10 -35  46 -27   6
%     -5  19 -27  17  -4
%      1  -4   6  -4   1
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The first row sums to 1, the others to 0.
%
%    The first column sums to 1, the others to 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
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

  for i = 1 : n
    for j = 1 : n
      a(i,j) = 0.0;
      klo = max ( i, j );
      for k = klo : n
        a(i,j) = a(i,j) + ( - 1.0 )^( i + j ) * r8_choose ( k - 1, i - 1 ) ...
          * r8_choose ( k - 1, j - 1 );
      end
    end
  end

  return
end
