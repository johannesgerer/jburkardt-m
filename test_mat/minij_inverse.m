function a = minij_inverse ( n )

%*****************************************************************************80
%
%% MINIJ_INVERSE returns the inverse of the MINIJ matrix.
%
%  Formula:
%
%    A(I,J) =  -1  if J=I-1 or J=I+1
%    A(I,J) =   2  if J=I and J is not N.
%    A(I,J) =   1  if J=I and J=N.
%    A(I,J) =   0  otherwise
%
%  Example:
%
%    N = 5
%
%     2 -1  0  0  0
%    -1  2 -1  0  0
%     0 -1  2 -1  0
%     0  0 -1  2 -1
%     0  0  0 -1  1
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
%    A is banded, with bandwidth 3.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is "almost" equal to the second difference matrix,
%    as computed by DIF.
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

      if ( i == j )
        if ( i < n )
          a(i,j) = 2.0;
        else
          a(i,j) = 1.0;
        end
      elseif ( i == j + 1 | i == j - 1 )
        a(i,j) = -1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
