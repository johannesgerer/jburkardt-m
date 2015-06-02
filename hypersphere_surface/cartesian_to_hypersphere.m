function [ r, theta ] = cartesian_to_hypersphere ( m, n, c, x )

%*****************************************************************************80
%
%% CARTESIAN_TO_HYPERSPHERE: Cartesian to hypersphere coordinate transform.
%
%  Discussion:
%
%    We allow the trivial case M = 1; in that case alone, the value R
%    must be assumed to have a sign.
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
%    1 <= M.
%
%    Input, integer N, the number of points to transform.
%
%    Input, real C(M,1), the center of the hypersphere.
%
%    Input, real X(M,N), the Cartesian coordinates of the points.
%
%    Output, real R(N,1), the radius of the points on the hypersphere.
%    Except for the trivial case M = 1, R is assumed nonnegative.
%
%    Output, real THETA(M-1,N), the coordinate angles of the points,
%    measured in radians.
%

%
%  Handle special case of M = 1.
%
  if ( m == 1 )
    r(1:n,1) = ( x(1,1:n) - c(1,1) )';
    theta = [];
    return
  end
%
%  Set aside memory.
%
  r = zeros ( n, 1 );
  theta = zeros ( m - 1, n );
%
%  Subtract the center.
%
  x(1:m,1:n) = x(1:m,1:n) - repmat ( c(1:m,1:1), 1, n );
%
%  Compute R.
%
  r(1,1:n) = sqrt ( sum ( x(1:m,1:n).^2, 1 ) );
%
%  Compute M-2 components of THETA.
%
  for i = 2 : m - 1
    theta(1:i-1,1:n) = theta(1:i-1,1:n) + repmat ( x(i,1:n).^2, i - 1, 1 );
  end
  theta(1:m-2,1:n) = theta(1:m-2,1:n) + repmat ( x(m,1:n).^2, m - 2, 1 );
  theta(1:m-2,1:n) = atan2 ( sqrt ( theta(1:m-2,1:n) ), x(1:m-2,1:n) );
%
%  Compute last component of THETA.
%
  top(1,1:n) = ( sqrt ( x(m,1:n).^2 + x(m-1,1:n).^2 ) + x(m-1,1:n) );
  theta(m-1,1:n) = 2.0 * atan2 ( x(m,1:n), top(1,1:n) );

  return
end
