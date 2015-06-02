function a = moler1 ( alpha, m, n )

%*****************************************************************************80
%
%% MOLER1 returns the MOLER1 matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = min ( I-1, J-1 ) * ALPHA^2 + 1
%    else
%      A(I,J) = min ( I-1, J-1 ) * ALPHA^2 + ALPHA
%
%  Example:
%
%    ALPHA = 2, M = N = 5
%
%    1 2  2  2  2
%    2 5  6  6  6
%    2 6  9 10 10
%    2 6 10 13 14
%    2 6 10 14 17
%
%  Properties:
%
%    Successive elements of each diagonal increase by an increment of ALPHA^2.
%
%    A is the product of B' * B, where B is the upper triangular matrix 
%    returned by
%
%      B = TRIW ( ALPHA, N-1, N ).
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is positive definite.
%
%    If ALPHA = -1, A(I,J) = min ( I, J ) - 2, A(I,I)=I.
%
%    A has one small eigenvalue.
%
%    If ALPHA is integral, then A is integral.
%    If A is integral, then det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The family of matrices is nested as a function of N.
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
%    John Nash,
%    Compact Numerical Methods for Computers: Linear Algebra and
%    Function Minimisation,
%    John Wiley, 1979,
%    pages 76 and 210.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the Moler matrix.
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( i == j )
        a(i,j) = min ( i-1, j-1 ) * alpha * alpha + 1.0;
      else
        a(i,j) = min ( i-1, j-1 ) * alpha * alpha + alpha;
      end

    end
  end

  return
end
