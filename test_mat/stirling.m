function a = stirling ( m, n )

%*****************************************************************************80
%
%% STIRLING returns a matrix of the Stirling numbers of the first kind.
%
%  Comments:
%
%    The absolute value of the Stirling number S1(I,J) gives the number
%    of permutations on I objects having exactly J cycles, while the
%    sign of the Stirling number records the sign (odd or even) of
%    the permutations.  For example, there are six permutations on 3 objects:
%
%      A B C   3 cycles (A) (B) (C)
%      A C B   2 cycles (A) (BC)
%      B A C   2 cycles (AB) (C)
%      B C A   1 cycle  (ABC)
%      C A B   1 cycle  (ABC)
%      C B A   2 cycles (AC) (B)
%
%    There are
%
%      2 permutations with 1 cycle, and S1(3,1) = 2
%      3 permutations with 2 cycles, and S1(3,2) = -3,
%      1 permutation with 3 cycles, and S1(3,3) = 1.
%
%    Since there are N% permutations of N objects, the sum of the absolute
%    values of the Stirling numbers in a given row,
%
%      sum ( 1 <= J <= I ) abs ( S1(I,J) ) = N%
%
%  First terms:
%
%    I/J:  1     2      3     4     5    6    7    8
%
%    1     1     0      0     0     0    0    0    0
%    2    -1     1      0     0     0    0    0    0
%    3     2    -3      1     0     0    0    0    0
%    4    -6    11     -6     1     0    0    0    0
%    5    24   -50     35   -10     1    0    0    0
%    6  -120   274   -225    85   -15    1    0    0
%    7   720 -1764   1624  -735   175  -21    1    0
%    8 -5040 13068 -13132  6769 -1960  322  -28    1
%
%  Recursion:
%
%    S1(I,1) = (-1)**(I-1) * (I-1)% for all I.
%    S1(I,I) = 1 for all I.
%    S1(I,J) = 0 if I < J.
%
%    S1(I,J) = S1(I-1,J-1) - (I-1) * S1(I-1,J)
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is lower triangular.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    After row 1, each row sums to 0.
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
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );
  
  a(1,1) = 1.0;
  a(1,2:n) = 0.0;

  for i = 2 : m

    a(i,1) = - ( i - 1 ) * a(i-1,1);

    for j = 2 : n
      a(i,j) = a(i-1,j-1) - ( i - 1 ) * a(i-1,j);
    end

  end

  return
end
