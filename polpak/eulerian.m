function e = eulerian ( n )

%*****************************************************************************80
%
%% EULERIAN computes the Eulerian number E(N,K).
%
%  Definition:
%
%    A run in a permutation is a sequence of consecutive ascending values.
%
%    E(N,K) is the number of permutations of N objects which contain
%    exactly K runs.
%
%  Examples:
%
%     N = 7
%
%     1     0     0     0     0     0     0
%     1     1     0     0     0     0     0
%     1     4     1     0     0     0     0
%     1    11    11     1     0     0     0
%     1    26    66    26     1     0     0
%     1    57   302   302    57     1     0
%     1   120  1191  2416  1191   120     1
%
%  Recursion:
%
%    E(N,K) = K * E(N-1,K) + (N-K+1) * E(N-1,K-1).
%
%  Properties:
%
%    E(N,1) = E(N,N) = 1.
%    E(N,K) = 0 if K <= 0 or N < K.
%    sum ( 1 <= K <= N ) E(N,K) = N!.
%    X^N = sum ( 0 <= K <= N ) COMB(X+K-1, N ) E(N,K)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton and Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, 1986
%
%  Parameters:
%
%    Input, integer N, the number of rows desired.
%
%    Output, integer E(N,N), the first N rows of Eulerian numbers.
%
  if ( n < 1 )
    e = [];
    return
  end

  e = zeros ( n, n );

%
%  Construct rows 1, 2, ..., N of the Eulerian triangle.
%
  e(1,1) = 1;
  e(1,2:n) = 0;

  for i = 2 : n
    e(i,1) = 1;
    for j = 2 : n
      e(i,j) = j * e(i-1,j) + ( i - j + 1 ) * e(i-1,j-1);
    end
  end

  return
end
