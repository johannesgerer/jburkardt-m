function a = parter_inverse ( n )

%*****************************************************************************80
%
%% PARTER_INVERSE returns the inverse of the PARTER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
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

      top = 1.0;
      bot1 = 1.0;
      bot2 = 1.0;

      for k = 1 : n

        top = top * ( 0.5 + ( j - k ) ) * ( 0.5 + ( k - i ) );

        if ( k ~= j )
          bot1 = bot1 * ( j - k );
        end

        if ( k ~= i )
          bot2 = bot2 * ( k - i );
        end

      end

      a(i,j) = top / ( ( 0.5 + ( j - i ) ) * bot1 * bot2 );

    end
  end

  return
end
