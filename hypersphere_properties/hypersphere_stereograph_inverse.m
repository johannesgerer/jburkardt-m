function x = hypersphere_stereograph_inverse ( m, n, x2 )

%*****************************************************************************80
%
%% HYPERSPHERE_STEREOGRAPH_INVERSE inverts a stereographic map.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%    M must be at least 2.
%
%    Input, integer N, the number of points.
%
%    Input, real X2(M-1,N), points in the plane.
%
%    Input, real X(M,N), points mapped back to the hypersphere.
%
  x = zeros ( m, n );

  x(1:m-1,1:n) = 2.0 * x2(1:m-1,1:n);

  d = sum ( x2(1:m-1,1:n).^2, 1 );

  x(m,1:n) = d - 1.0;
  
  x(1:m,1:n) = x(1:m,1:n) ./ repmat ( d + 1.0, m, 1 );

  return
end

