function [ p, l, u ] = vand2_plu ( n, x )

%*****************************************************************************80
%
%% VAND2_PLU returns the PLU factors of the VAND2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Halil Oruc, George Phillips,
%    Explicit factorization of the Vandermonde matrix,
%    Linear Algebra and its Applications,
%    Volume 315, Number 1-3, 15 August 2000, pages 113-123.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N), the values that define the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N), the PLU factors.
%
  p = zeros ( n, n );

  for j = 1 : n
    p(j,j) = 1.0;
  end

  l = zeros ( n, n );

  for i = 1 : n
    for j = 1 : i
      l(i,j) = 1.0;
      for k = 1 : j - 1
        l(i,j) = l(i,j) * ( x(i) - x(k) ) / ( x(j) - x(k) );
      end
    end 
  end

  u = zeros ( n, n );

  for i = 1 : n
    for j = i : n
      u(i,j) = complete_symmetric_poly ( i, j - i, x );
      for k = 1 : i - 1
        u(i,j) = u(i,j) * ( x(i) - x(k) );
      end
    end
  end

  return
end

