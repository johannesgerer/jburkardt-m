function a = gk324_inverse ( n, x )

%*****************************************************************************80
%
%% GK324_INVERSE returns the inverse of the GK324 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%   18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 51, 
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N-1), the first N-1 entries of the last row.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i < n )

        if ( j < i )
          a(i,j) = 0.0;
        elseif ( j == i )
          a(i,j) = 1.0 / ( 1.0 - x(i) );
        elseif ( j == i + 1 )
          a(i,j) = - 1.0 / ( 1.0 - x(i) );
        elseif ( i + 1 < j )
          a(i,j) = 0.0;
        end

      elseif ( i == n )

        if ( j == 1 )

          a(i,j) = - x(1) / ( 1.0 - x(1) );

        elseif ( j < n )

          a(i,j) = ( x(j-1) - x(j) ) / ( 1.0 - x(j) ) / ( 1.0 - x(j-1) );

        elseif ( j == n )

          a(i,j) = 1.0 / ( 1.0 - x(n-1) );

        end

      end

    end
  end

  return
end
