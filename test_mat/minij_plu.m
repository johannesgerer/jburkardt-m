function [ p, l, u ] = minij_plu ( n )

%*****************************************************************************80
%
%% MINIJ_PLU returns the PLU factors of the MINIJ matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N) the PLU factors.
%
  for j = 1 : n
    for i = 1 : n
      if ( i == j )
        p(i,j) = 1.0;
      else
        p(i,j) = 0.0;
      end
    end
  end

  for j = 1 : n
    for i = 1 : j - 1
      l(i,j) = 0.0;
    end
    for i = j : n
      l(i,j) = 1.0;
    end
  end

  for j = 1 : n
    for i = 1 : j
      u(i,j) = 1.0;
    end
    for i = j + 1 : n
      u(i,j) = 0.0;
    end
  end

  return
end
