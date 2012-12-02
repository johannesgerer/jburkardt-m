function [ p, l, u ] = oto_plu ( n )

%*****************************************************************************80
%
%% OTO_PLU returns the PLU factors of the OTO matrix.
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
      elseif ( i == j + 1 )
        l(i,j) = j / ( j + 1 );
      else
        l(i,j) = 0.0;
      end
    end
  end

 for j = 1 : n
   for i = 1 : n
      if ( i == j )
        u(i,j) = ( i + 1 ) / i;
      elseif ( i == j - 1 )
        u(i,j) = 1.0;
      else
        u(i,j) = 0.0;
      end
    end
  end

  return
end
