function a = kahan_inverse ( alpha, n )

%*****************************************************************************80
%
%% KAHAN_INVERSE returns the inverse of the KAHAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.  A typical 
%    value is 1.2.  The "interesting" range of ALPHA is 0 < ALPHA < PI.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  ci = cos ( alpha );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = 1.0;
      elseif ( i == j - 1 )
        a(i,j) = ci;
      elseif ( i < j )
        a(i,j) = ci * ( 1.0 + ci )^(j-i-1);
      else
        a(i,j) = 0.0;
      end

    end
  end
%
%  Scale the columns.
%
  for j = 1 : n
    si = sin ( alpha )^j;
    a(1:n,j) = a(1:n,j) / si;
  end

  return
end
