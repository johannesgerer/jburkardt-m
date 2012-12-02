function a = gk316_inverse ( n )

%*****************************************************************************80
%
%% GK316_INVERSE returns the inverse of the GK316 matrix.
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
  t = 6.0 / ( n * ( n + 1 ) * ( 2 * n - 5 ) );

  for i = 1 : n
    for j = 1 : n

      if ( i == j & i < n )
        a(i,j) = 1.0 - t * i * i;
      elseif ( i == j & i == n )
        a(i,j) = - t;
      elseif ( i < n & j < n )
        a(i,j) = - t * i * j;
      elseif ( i == n )
        a(i,j) = t * j;
      elseif ( j == n )
        a(i,j) = t * i;
      end

    end
  end

  return
end
