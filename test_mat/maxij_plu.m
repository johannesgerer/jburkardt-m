function [ p, l, u ] = maxij_plu ( n )

%*****************************************************************************80
%
%% MAXIJ_PLU returns the PLU factors of the MAXIJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N), the PLU factors.
%
  p = zeros ( n, n );

  for j = 1 : n
    for i = 1 : n
      if ( i4_wrap ( j - i, 1, n ) == 1 )
        p(i,j) = 1.0;
      end
    end
  end

  l = zeros ( n, n );

  i = 1;
  j = 1;
  l(i,j) = 1.0;

  j = 1;
  for i = 2 : n
    l(i,j) = ( i - 1 ) / n;
  end

  for j = 2 : n
    l(j,j) = 1.0;
  end

  u = zeros ( n, n );

  i = 1;
  for j = 1 : n
    u(i,j) = n;
  end

  for i = 2 : n
    for j = i : n
      u(i,j) = j + 1 - i;
    end
  end

  return
end
