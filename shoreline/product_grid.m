function x = product_grid ( m, a, b, n, c, d )

%*****************************************************************************80
%
%% PRODUCT_GRID produces a product grid of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real M, the number of grid points in X.
%
%    Input, real A, B, the X limits.
%
%    Input, real N, the number of grid points in Y.
%
%    Input, real C, D, the Y limits.
%
%    Output, real X(M*N,2), the points of the product grid.
%
  x = zeros ( m * n, 2 );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      x(k,1) = ( ( m - i ) * a + ( i - 1 ) * b ) / ( m - 1 );
      x(k,2) = ( ( n - j ) * c + ( j - 1 ) * d ) / ( n - 1 );
    end
  end

  return
end
