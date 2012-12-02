function [ p, l, u ] = borderband_plu ( n )

%*****************************************************************************80
%
%% BORDERBAND_PLU returns the PLU factors of the BORDERBAND matrix.
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
%    Output, real P(N,N), L(N,N), U(N,N), the PLU factors.
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
    for i = 1 : n
      if ( i == j )
        l(i,j) = 1.0;
      elseif ( i == n )
        l(i,j) = 2.0^(1-j);
      else
        l(i,j) = 0.0;
      end
    end
  end

  for j = 1 : n
    for i = 1 : n
      if ( i == n && j == n )
        u(i,j) = 0.0;
        for k = 2 : n - 1
          u(i,j) = u(i,j) - 2.0^(2-2*k);
        end
      elseif ( i == j )
        u(i,j) = 1.0;
      elseif ( j == n )
        u(i,j) = 2.0^(1-i);
      else
        u(i,j) = 0.0;
      end
    end
  end

  return
end
