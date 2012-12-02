function [ p, l, u ] = dif2_plu ( n )

%*****************************************************************************80
%
%% DIF2_PLU returns the PLU factors of the DIF2 matrix.
%
%  Discussion:
%
%    A = P * L * U
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
%    Input, integer N, the order of A.
%
%    Output, real P(N,N), L(N,N), U(N,N), the pivot
%    matrix, the unit lower triangular matrix, and the upper
%    triangular matrix that form the PLU factoriztion of A.
%
  p(1:n,1:n) = 0.0;
  for i = 1 : n
    p(i,i) = 1.0;
  end

  l(1:n,1:n) = 0.0;
  for i = 1 : n
    l(i,i) = 1.0;
  end
  for i = 1 : n - 1
    l(i+1,i) = - i / ( i + 1 );
  end

  u(1:n,1:n) = 0.0;
  for i = 1 : n
    u(i,i) = ( i + 1 ) / i;
  end
  for i = 1 : n - 1
    u(i,i+1) = -1.0;
  end

  return
end
