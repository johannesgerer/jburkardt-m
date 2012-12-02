function a = carry_right ( n )

%*****************************************************************************80
%
%% CARRY_RIGHT returns the Carry right eigenvector matrix.
%
%  Formula:
%
%    A(I,J) = sum ( N+1-J) <= K <= N )
%      S1(N,K) * C(K,N+1-J) ( N - I )**(K-N+J-1)
%
%    where S1(N,K) is a signed Sterling number of the first kind.
%
%  Example:
%
%    N = 4
%
%    1   6  11   6
%    1   2  -1  -2
%    1  -2  -1   2
%    1  -6  11  -6
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The first column is all 1's.
%
%    The last column is reciprocals of binomial coefficients with
%    alternating sign multiplied by (N-1)%.
%
%    The top and bottom rows are the unsigned and signed Stirling numbers
%    of the first kind.
%
%    The entries in the J-th column are a degree (J-1) polynomial
%    in the row index I.  (Column 1 is constant, the first difference
%    in column 2 is constant, the second difference in column 3 is
%    constant, and so on.)
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
%  Reference:
%
%    John Holte,
%    Carries, Combinatorics, and an Amazing Matrix,
%    The American Mathematical Monthly,
%    February 1997, pages 138-149.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  s1 = stirling ( n, n );

  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      for k = n+1-j : n
        if ( n - i == 0 & k - n + j - 1 == 0 )
          a(i,j) = a(i,j) + s1(n,k) * comb ( k, n+1-j );
        else
          a(i,j) = a(i,j) + s1(n,k) * comb ( k, n+1-j ) * ( n - i )^(k-n+j-1);
        end
      end

    end

  end

  return
end
