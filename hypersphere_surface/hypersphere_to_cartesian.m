function x = hypersphere_to_cartesian ( m, n, c, r, theta )

%*****************************************************************************80
%
%% HYPERSPHERE_TO_CARTESIAN: hypersphere to Cartesian coordinate transform.
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
%    Input, real R(N,1), the radius of the points on the hypersphere.
%    Except for the trivial case M = 1, R is assumed nonnegative.
%
%    Input, real THETA(M-1,N), the coordinate angles of the points,
%    measured in radians.
%
%    Output, real X(M,N), the Cartesian coordinates of the points.
%
  x = zeros ( m, n );
%
%  Make R a row vector.
%
  r = ( r(:) )';
%
%  Handle special case of M = 1.
%
  if ( m == 1 )
    x(1:1,1:n) = repmat ( c(1:1,1:1), 1, n ) ...
               + repmat ( r(1:1,1:n), 1, 1 );
    return
  end

  x(1:m,1:n) = repmat ( r(1:1,1:n), m, 1 );

  for i1 = 1 : m - 1
    x(i1,1:n) = x(i1,1:n) .* cos ( theta(i1,1:n) );
    for i2 = i1 + 1 : m
      x(i2,1:n) = x(i2,1:n) .* sin ( theta(i1,1:n) );
    end
  end
%
%  Add the center.
%
  x(1:m,1:n) = x(1:m,1:n) + repmat ( c(1:m,1:1), 1, n );

  return
end
