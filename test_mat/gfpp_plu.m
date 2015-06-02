function [ p, l, u ] = gfpp_plu ( n, alpha )

%*****************************************************************************80
%
%% GFPP_PLU returns the PLU factorization of the GFPP matrix.
%
%  Discussion
%
%    This factorization assumes that Gaussian elimination is performed
%    without pivoting.  If ALPHA is not between 0 and 1, then the
%    PLU factors returned here will not be the PLU factors derived
%    from Gaussian elimination with pivoting.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, determines subdiagonal elements.
%
%    Output, real P(N,N), L(N,N), U(N,N), the P, L, U factors
%    of the matrix.
%
  p = zeros ( n, n );
  for i = 1 : n
    p(i,i) = 1.0;
  end

  l = zeros ( n, n );
  for i = 1 : n
    l(i,1:i-1) = - abs ( alpha );
    l(i,i) = 1.0;
    l(i,i+1:n) = 0.0;
  end

  u = zeros ( n, n );
  u(1:n,1:n) = 0.0;
  for i = 1 : n
    u(i,i) = 1.0;
  end
  
  u(1,n) = 1.0;
  for i = 2 : n
    u(i,n) = 1.0 + abs ( alpha ) * sum ( u(1:i-1,n) );
  end

  return
end
