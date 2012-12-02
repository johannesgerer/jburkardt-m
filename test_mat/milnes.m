function a = milnes ( m, n, x )

%*****************************************************************************80
%
%% MILNES returns the Milnes matrix.
%
%  Formula:
%
%    If ( I <= J )
%      A(I,J) = 1
%    else
%      A(I,J) = X(J)
%
%  Example:
%
%    M = 5, N = 5, X = ( 4, 7, 3, 8 )
%
%    1 1 1 1 1
%    4 1 1 1 1
%    4 7 1 1 1
%    4 7 3 1 1
%    4 7 3 8 1
%
%    M = 3, N = 6, X = ( 5, 7 )
%
%    1 1 1 1 1
%    5 1 1 1 1
%    5 7 1 1 1
%
%    M = 5, N = 3, X = ( 5, 7, 8 )
%
%    1 1 1
%    5 1 1
%    5 7 1
%    5 7 8
%    5 7 8
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    det ( A ) = ( 1 - X(1) ) * ( 1 - X(2) ) * ... * ( 1 - X(N-1) ).
%
%    A is singular if and only if X(I) = 1 for any I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.14, Example 5.24,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 52, page 105,
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, real X(*), the lower column values.
%    If M <= N, then X should be dimensioned M-1.
%    If N < M, X should be dimensioned N.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n
      if ( i <= j )
        a(i,j) = 1.0;
      else
        a(i,j) = x(j);
      end
    end
  end

  return
end
