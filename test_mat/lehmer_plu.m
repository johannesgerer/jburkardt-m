function [ p, l, u ] = lehmer_plu ( n )

%*****************************************************************************80
%
%% LEHMER_PLU returns the PLU factors of the LEHMER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Emrah Kilic, Pantelimon Stanica,
%    The Lehmer matrix and its recursive analogue,
%    Journal of Combinatorial Mathematics and Combinatorial Computing,
%    Volume 74, August 2010, pages 193-205.
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
    l(j,j) = 1.0;
    for i = j + 1 : n
      l(i,j) = j / i;
    end
  end

  u = zeros ( n, n );
  for j = 1 : n
    for i = 1 : j
      u(i,j) = ( 2 * i - 1 ) / ( i * j );
    end
  end

  return
end
