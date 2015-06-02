function a = conference_inverse ( n )

%*****************************************************************************80
%
%% CONFERENCE_INVERSE returns the inverse of the CONFERENCE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2007
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
      if ( i == 1 & j == 1 )
        a(i,j) = 0.0;
      elseif ( i == 1 )
        a(i,j) = 1.0;
      elseif ( j == 1 )
        if ( mod ( n - 1, 4 ) == 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = - 1.0;
        end
      else
        a(i,j) = legendre_symbol ( i - j, n - 1 );
      end
    end
  end

  if ( mod ( n - 1, 4 ) == 3 )
    a(1:n,1:n) = - a(1:n,1:n);
  end

  if ( 1 < n )
    a(1:n,1:n) = a(1:n,1:n) / ( n - 1 );
  end

  return
end

