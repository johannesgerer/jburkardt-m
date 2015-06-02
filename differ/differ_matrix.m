function a = differ_matrix ( n, stencil )

%*****************************************************************************80
%
%% DIFFER_MATRIX computes the stencil matrix from the stencil vector.
%
%  Discussion:
%
%    If N = 4, and STENCIL = ( -3, -2, -1, 1 ), then A will be
%
%    -3  -2  -1  1
%     9   4   1  1
%   -27  -8  -1  1
%    81  16   1  1
%
%    This matrix is a generalized form of a Vandermonde matrix A2:
%
%     1   1   1  1
%    -3  -2  -1  1
%     9   4   1  1
%   -27  -8  -1  1    
%
%    and if A * x = b, the A2 * x2 = b, where x2(i) = x(i) * stencil(i)
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
%  Parameters:
%
%    Input, integer N, the number of stencil points.
%
%    Input, real STENCIL(N,1), the stencil vector.
%    The entries in this vector must be distinct.
%    No entry of STENCIL may be 0.
%
%    Output, real A(N,N), the stencil matrix.
%
  a = zeros ( n, n );

  a(1,1:n) = stencil(1:n,1)';
  for i = 2 : n
    a(i,1:n) = a(i-1,1:n) .* stencil(1:n,1)';
  end

  return
end
