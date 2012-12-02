function a = milnes_inverse ( n, x )

%*****************************************************************************80
%
%% MILNES_INVERSE returns the inverse of the Milnes matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.24,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 52, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), the lower column values.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j & i ~= n )
        a(i,j) = 1.0 / ( 1.0 - x(i) );
      elseif ( j == i + 1 & i ~= n )
        a(i,j) = -1.0 / ( 1.0 - x(i) );
      elseif ( i == n & j ~= 1 & j ~= n )
        a(i,j) = ( x(j-1) - x(j) ) / ( ( 1.0 - x(j) ) * ( 1.0 - x(j-1) ) );
      elseif ( i == n & j == 1 )
        a(i,j) = - x(1) / ( 1.0 - x(1) );
      elseif ( i == n & j == n )
        a(i,j) = 1.0 / ( 1.0 - x(n-1) );
      else
        a(i,j) = 0.0;
      end
    end
  end

  return
end
