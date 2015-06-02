function a = pascal1 ( n )

%*****************************************************************************80
%
%% PASCAL1 returns the PASCAL1 matrix.
%
%  Formula:
%
%    if ( J = 1 )
%      A(I,J) = 1
%    elseif ( I = 0 )
%      A(1,J) = 0
%    else
%      A(I,J) = A(I-1,J) + A(I-1,J-1)
%
%  Example:
%
%    N = 5
%
%    1  0  0  0  0
%    1  1  0  0  0
%    1  2  1  0  0
%    1  3  3  1  0
%    1  4  6  4  1
%
%  Properties:
%
%    A is a "chunk" of the Pascal binomial combinatorial triangle.
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular.
%
%    A is lower triangular.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
%
%    (0, 0, ..., 0, 1) is an eigenvector.
%
%    The inverse of A is the same as A, except that entries in "odd"
%    positions have changed sign:
%
%      B(I,J) = (-1)^(I+J) * A(I,J)
%
%    The product A*A' is a Pascal matrix
%    of the sort created by subroutine PASCAL2.
%
%    Let the matrix C have the same entries as A, except that
%    the even columns are negated.  Then Inverse(C) = C, and
%    C' * C = the Pascal matrix created by PASCAL2.
%
%    The family of matrices is nested as a function of N.
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
%    Robert Gregory, David Karney,
%    Example 3.15,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 43, 
%    LC: QA263.G68.
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

      if ( j == 1 )
        a(i,j) = 1.0;
      elseif ( i == 1 )
        a(i,j) = 0.0;
      else
        a(i,j) = a(i-1,j-1) + a(i-1,j);
      end

    end
  end

  return
end
