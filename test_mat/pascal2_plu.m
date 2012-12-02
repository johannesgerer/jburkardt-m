function [ p, l, u ] = pascal2_plu ( n )

%*****************************************************************************80
%
%% PASCAL2_PLU returns the PLU factors of the PASCAL2 matrix.
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
  p = zeros ( n, n );

 for j = 1 : n
   for i = 1 : n
      if ( i == j )
        p(i,j) = 1.0;
      else
        p(i,j) = 0.0;
      end
    end
  end

  l = pascal1 ( n );

  u = l';

  return
end
