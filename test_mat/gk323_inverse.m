function a = gk323_inverse ( n )

%*****************************************************************************80
%
%% GK323_INVERSE returns the inverse of the GK323 matrix.
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
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
        if ( i == 1 | i == n )
          a(i,j) = - 0.5 * ( n - 2 ) / ( n - 1 );
        else
          a(i,j) = - 1.0;
        end
      elseif ( i == j+1 | i == j-1 )
        a(i,j) = 0.5;
      elseif ( i == 1 & j == n )
        a(i,j) = 0.5 / ( n - 1 );
      elseif ( i == n & j == 1 )
        a(i,j) = 0.5 / ( n - 1 );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
