function a = triv ( n, x, y, z )

%*****************************************************************************80
%
%% TRIV returns the tridiagonal matrix A defined by three vectors.
%
%  Discussion:
%
%    The three vectors define the subdiagonal, main diagonal, and
%    superdiagonal.
%
%  Formula:
%
%    if ( J = I - 1 )
%      A(I,J) = X(J)
%    elseif ( J = I )
%      A(I,J) = Y(I)
%    elseif ( J = I + 1 )
%      A(I,J) = Z(I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3, 4 ), Y = ( 5, 6, 7, 8, 9 ), Z = ( 10, 11, 12, 13 )
%
%     5 10  0  0  0
%     1  6 11  0  0
%     0  2  7 12  0
%     0  0  3  8 13
%     0  0  0  4  9
%
%  Properties:
%
%    A is tridiagonal.
%
%    A is banded, with bandwidth 3.
%
%    A is generally not symmetric: A' /= A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), Y(N), Z(N-1), the vectors that define
%    the subdiagonal, diagonal, and superdiagonal of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( j == i - 1 )
        a(i,j) = x(j);
      elseif ( j == i )
        a(i,j) = y(i);
      elseif ( j == i + 1 )
        a(i,j) = z(i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
