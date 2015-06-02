function [ u, l ] = vand2_inverse_ul ( n, x )

%*****************************************************************************80
%
%% VAND2_INVERSE_UL returns the UL factors of the VAND2 inverse matrix.
%
%  Discussion:
%
%    inverse ( A ) = U * L
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Turner,
%    Inverse of the Vandermonde Matrix with Applications,
%    NASA Technical Note TN D-3547, 1966.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N), the values that define A.
%
%    Output, real U(N,N), L(N,N), the UL factors of inverse(A).
%
  u = zeros ( n, n );

  for i = 1 : n
    u(i,i) = 1.0;
    if ( i == 1 )
      for j = i + 1 : n
        u(i,j) = - u(i,j-1) * x(j-1);
      end
    else
      for j = i + 1 : n
        u(i,j) = u(i-1,j-1) - u(i,j-1) * x(j-1);
      end
    end
  end
 
  l = zeros ( n, n );

  for i = 1 : n
    l(i,1:i) = 1.0;    
    for j = 1 : i
      for k = 1 : i
        if ( j ~= k )
          l(i,j) = l(i,j) / ( x(j) - x(k) );
        end
      end
    end
  end

  return
end
