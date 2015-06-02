function [ u, l ] = vand1_inverse_ul ( n, x )

%*****************************************************************************80
%
%% VAND1_INVERSE_UL returns the UL factors of the VAND1 inverse.
%
%  Discussion:
%
%    inverse ( A ) = U * L.
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
    u(1:i,i) = 1.0;    
    for j = 1 : i
      for k = 1 : i
        if ( j ~= k )
          u(j,i) = u(j,i) / ( x(j) - x(k) );
        end
      end
    end
  end

  l = zeros ( n, n );

  for i = 1 : n
    l(i,i) = 1.0;
    if ( i == 1 )
      for j = i + 1 : n
        l(j,i) = - l(j-1,i) * x(j-1);
      end
    else
      for j = i + 1 : n
        l(j,i) = l(j-1,i-1) - l(j-1,i) * x(j-1);
      end
    end
  end
 
  return
end
