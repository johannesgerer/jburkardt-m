function a = schur_block_inverse ( n, x, y )

%*****************************************************************************80
%
%% SCHUR_BLOCK_INVERSE returns the inverse of the SCHUR_BLOCK matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X( (N+1)/2 ), specifies the diagonal elements
%    of A.
%
%    Input, real Y( N/2 ), specifies the off-diagonal elements 
%    of the Schur blocks.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      k = floor ( ( i + 1 ) / 2 );

      if ( i == j )

        if ( i == n & mod ( n, 2 ) == 1 )
          a(i,j) = 1.0 / x(k);
        else
          a(i,j) = x(k) / ( x(k)^2 + y(k)^2 );
        end

      elseif ( mod ( i, 2 ) == 1 & j == i + 1 )

        a(i,j) = - y(k) / ( x(k)^2 + y(k)^2 );

      elseif ( mod ( i, 2 ) == 0 & j == i - 1 )

        a(i,j) =   y(k) / ( x(k)^2 + y(k)^2 );

      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
