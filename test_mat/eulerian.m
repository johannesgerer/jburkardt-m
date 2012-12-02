function a = eulerian ( m, n )

%*****************************************************************************80
%
%% EULERIAN returns the Eulerian matrix.
%
%  Definition:
%
%    A run in a permutation is a sequence of consecutive ascending values.
%
%    E(I,J) is the number of permutations of I objects which contain
%    exactly J runs.
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
%    E(I,J) = J * E(I-1,J) + (I-J+1) * E(I-1,J-1).
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral: int ( A ) = A.
%
%    A is nonnegative.
%
%    A is unit lower triangular.
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
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer Verlag, 1986.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  a(1,1) = 1.0;
  a(1,2:n) = 0.0;

  for i = 2 : m
    a(i,1) = 1.0;
    for j = 2 : n
      a(i,j) = j * a(i-1,j) + ( i - j + 1 ) * a(i-1,j-1);
    end
  end

  return
end
