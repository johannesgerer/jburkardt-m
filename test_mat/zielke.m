function a = zielke ( n, x, y, z )

%*****************************************************************************80
%
%% ZIELKE returns the modified Zielke matrix.
%
%  Formula:
%
%    if ( I = J ) then
%      if ( I+J <= N )
%        A(I,J) = X+Y+Z
%      else if ( I+J ) < 2*N )
%        A(I,J) = X  +Z
%      else
%        A(I,J) = X-Y+Z
%    else
%      if ( I+J <= N )
%        A(I,J) = X+Y
%      else
%        A(I,J) = X
%
%  Example:
%
%   N = 5, X = 1, Y = 2, Z = 5
%
%    8 3 3 3 1
%    3 8 3 1 1
%    3 3 6 1 1
%    3 1 1 6 1
%    1 1 1 1 4
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    There are clusters of eigenvalues.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gerhard Zielke,
%    Testmatrizen mit maximaler Konditionszahl,
%    (Test matrices with maximal condition number),
%    Computing,
%    Volume 13, pages 33-54, 1974.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X, Y, Z, parameters that define the matrix.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        if ( i + j <= n )
          a(i,j) = x + y + z;
        elseif ( i + j < 2 * n )
          a(i,j) = x + z;
        else
          a(i,j) = x - y + z;
        end
      else
        if ( i + j <= n )
          a(i,j) = x + y;
        else
          a(i,j) = x;
        end
      end

    end
  end

  return
end
