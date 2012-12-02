function a = pascal3 ( n, alpha )

%*****************************************************************************80
%
%% PASCAL3 returns the PASCAL3 matrix.
%
%  Formula:
%
%    if ( J = 1 )
%      A(I,J) = 1
%    elseif ( I = 0 )
%      A(1,J) = 0
%    else
%      A(I,J) =  ALPHA * A(I-1,J) + A(I-1,J-1) )
%
%  Example:
%
%    N = 5, ALPHA = 2
%
%     1   0   0   0   0
%     2   1   0   0   0
%     4   4   1   0   0
%     8  12   6   1   0
%    16  32  24   8   1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A[0] is the identity matrix.
%
%    A[1] is the usual (lower triangular) Pascal matrix.
%
%    A is nonsingular.
%
%    A is lower triangular.
%
%    If ALPHA is integral, then A is integral.
%    If A is integral, then det ( A ) is integral, and 
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
%    The inverse of A[ALPHA] is A[-ALPHA].
%
%    A[ALPHA] * A[BETA] = A[ALPHA*BETA].
%
%    A[1/2] is the "square root" of A[1], and so on.
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
%  Reference:
%
%    Gregory Call, Daniel Velleman,
%    Pascal's Matrices,
%    American Mathematical Monthly,
%    Volume 100, Number 4, April 1993, pages 372-376.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )

        if ( j == 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      elseif ( j == 1 )

        a(i,j) = alpha * a(i-1,j);

      else

        a(i,j) = a(i-1,j-1) + alpha * a(i-1,j);

      end

    end
  end

  return
end
