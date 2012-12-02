function [ p, l, u ] = givens_plu ( n )

%*****************************************************************************80
%
%% GIVENS_PLU returns the PLU factors of the GIVENS matrix.
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
      if ( i == j )
        p(i,j) = 1.0;
      end
    end
  end

  l = zeros ( n, n );

  for j = 1 : n
    for i = j : n
      l(i,j) = 1.0;
    end
  end

  u = zeros ( n, n );

  i = 1;
  for j = 1 : n
    u(i,j) = 1.0;
  end

  for i = 2 : n
    for j = i : n
      u(i,j) = 2.0;
    end
  end

  return
end
