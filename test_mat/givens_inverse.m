function a = givens_inverse ( n )

%*****************************************************************************80
%
%% GIVENS_INVERSE returns the inverse of the GIVENS matrix.
%
%  Formula:
%
%    if ( I = J = 1 )
%      A(I,J) = 1.5
%    elseif ( I = J < N )
%      A(I,J) = 1.0
%    elseif ( I = J = N )
%      A(I,J) = 0.5
%    elseif ( J = I+1 or J = I-1 )
%      A(I,J) = -0.5
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%           3 -1  0  0  0
%          -1  2 -1  0  0
%    1/2 *  0 -1  2 -1  0
%           0  0 -1  2 -1
%           0  0  0 -1  1
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
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

      if ( i == j )
        if ( i == 1 )
          a(i,j) = 1.5;
        elseif ( i < n )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.5;
        end
      elseif ( i == j+1 )
        a(i,j) = - 0.5;
      elseif ( i == j-1 )
        a(i,j) = - 0.5;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
