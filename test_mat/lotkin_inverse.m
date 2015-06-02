function a = lotkin_inverse ( n )

%*****************************************************************************80
%
%% LOTKIN_INVERSE returns the inverse of the LOTKIN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
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

      if ( j == 1 )

        a(i,j) = (-1)^( n - i ) * r8_choose ( n+i-1, i-1 ) * r8_choose ( n, i );

      else

        a(i,j) = (-1)^(i-j+1) * i * r8_choose ( i+j-1, j-1 ) ...
          * r8_choose ( i+j-2, j-2 ) * r8_choose ( n+i-1, i+j-1 ) ...
          * r8_choose ( n+j-1, i+j-1 );

      end

    end
  end

  return
end
