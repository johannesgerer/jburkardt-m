function a = maxij_inverse ( n )

%*****************************************************************************80
%
%% MAXIJ_INVERSE returns the inverse of the MAXIJ matrix.
%
%  Formula:
%
%    if ( I = 1 and J = 1 )
%      A(I,J) = -1
%    else if ( I = N and J = N )
%      A(I,J) = -(N-1)/N
%    else if ( I = J )
%      A(I,J) = -2
%    else if ( J = I-1 or J = I + 1 )
%      A(I,J) =  1
%    else
%      A(I,J) =  0
%
%  Example:
%
%    N = 5
%
%    -1  1  0  0   0
%     1 -2  1  0   0
%     0  1 -2  1   0
%     0  0  1 -2   1
%     0  0  0  1 -4/5
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
%    A is "almost" equal to the second difference matrix.
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
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i )

        if ( i == 1 )
          a(i,j) = - 1.0;
        elseif ( i < n )
          a(i,j) = - 2.0;
        else
          a(i,j) = - ( n - 1 ) / n;
        end

      elseif ( j == i - 1 | j == i + 1 )

        a(i,j) = 1.0;

      else

        a(i,j) = 0.0;

      end

    end
  end

  return
end
