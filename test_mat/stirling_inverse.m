function a = stirling_inverse ( n )

%*****************************************************************************80
%
%% STIRLING_INVERSE returns the inverse of the STIRLING matrix.
%
%  Comments:
%
%    The inverse of S1, the matrix of Stirling numbers of the first kind,
%    is S2, the matrix of Stirling numbers of the second kind.
%
%    S2(I,J) represents the number of distinct partitions of I elements
%    into J nonempty sets.  For any I, the sum over J of the Stirling
%    numbers S2(I,J) is represented by B(I), called "Bell's number",
%    and represents the number of distinct partitions of I elements.
%
%    For example, with 4 objects, there are:
%
%    1 partition into 1 set:
%
%      (A,B,C,D)
%
%    7 partitions into 2 sets:
%
%      (A,B,C) (D)
%      (A,B,D) (C)
%      (A,C,D) (B)
%      (A) (B,C,D)
%      (A,B) (C,D)
%      (A,C) (B,D)
%      (A,D) (B,C)
%
%    6 partitions into 3 sets:
%
%      (A,B) (C) (D)
%      (A) (B,C) (D)
%      (A) (B) (C,D)
%      (A,C) (B) (D)
%      (A,D) (B) (C)
%      (A) (B,D) (C)
%
%    1 partition into 4 sets:
%
%      (A) (B) (C) (D)
%
%    So S2(4,1) = 1, S2(4,2) = 7, S2(4,3) = 6, S2(4,4) = 1, and B(4) = 15.
%
%
%  First terms:
%
%    I/J: 1    2    3    4    5    6    7    8
%
%    1    1    0    0    0    0    0    0    0
%    2    1    1    0    0    0    0    0    0
%    3    1    3    1    0    0    0    0    0
%    4    1    7    6    1    0    0    0    0
%    5    1   15   25   10    1    0    0    0
%    6    1   31   90   65   15    1    0    0
%    7    1   63  301  350  140   21    1    0
%    8    1  127  966 1701 1050  266   28    1
%
%  Recursion:
%
%    S2(I,1) = 1 for all I.
%    S2(I,I) = 1 for all I.
%    S2(I,J) = 0 if I < J.
%
%    S2(I,J) = J * S2(I-1,J) + S2(I-1,J-1)
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is lower triangular.
%
%    A is nonnegative.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the  matrix.
%
  a = zeros ( n, n );

  a(1,1) = 1.0;
  a(1,2:n) = 0.0;

  for i = 2 : n

    a(i,1) = 1.0;

    for j = 2 : n
      a(i,j) = j * a(i-1,j) + a(i-1,j-1);
    end

  end

  return
end

