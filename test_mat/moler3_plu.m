function [ p, l, u ] = moler3_plu ( n )

%*****************************************************************************80
%
%% MOLER3_PLU returns the PLU factors of the MOLER3 matrix.
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

  l = zeros ( n, n );

  for i = 1 : n
    l(i,1:i-1  ) = -1.0;
    l(i,  i    ) =  1.0;
    l(i,  i+1:n) =  0.0;
  end

  u = zeros ( n, n );

  for j = 1 : n
    u(1:j-1,  j) = -1.0;
    u(  j,    j) =  1.0;
    u(  j+1:n,j) =  0.0;
  end

  return
end
