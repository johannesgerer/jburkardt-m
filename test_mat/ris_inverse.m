function a = ris_inverse ( n )

%*****************************************************************************80
%
%% RIS_INVERSE returns the inverse of the Ris matrix.
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
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      top = 1.0;
      bot1 = 1.0;
      bot2 = 1.0;

      for k = 1 : n

        top = top * ( 3 + 2 * n - 2 * j - 2 * k ) ...
          * ( 3 + 2 * n - 2 * k - 2 * i );

        if ( k ~= j )
          bot1 = bot1 * ( 2 * ( k - j ) );
        end

        if ( k ~= i )
          bot2 = bot2 * ( 2 * ( k - i ) );
        end

      end

      a(i,j) = top / ( ( 3 + 2 * n - 2 * j - 2 * i ) * bot1 * bot2 );

    end
  end

  return
end
