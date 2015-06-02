function x = cube_surface_sample ( m, n, c, r )

%*****************************************************************************80
%
%% CUBE_SURFACE_SAMPLE returns random points on the surface of a cube.
%
%  Discussion:
%
%    The cube is assumed to be aligned with the coordinate axes.
%
%    The cube has center C and radius R.  Any point on the surface of
%    the cube is described by
%
%      X = C + R * PM
%
%    where PM is an M-dimensional vector whose entries are between
%    -1 and +1, and for which at least one value has norm 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2013
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
%    Input, integer N, the number of points.
%
%    Input, real C(M,1), the coordinates of the center.
%    Default value is the origin.
%
%    Input, real R, the radius.
%    Default value is 1.
%
%    Output, real X(M,N), the coordinates of N points, chosen uniformly at
%    random from the surface of the M-cube of center C and radius R.
%
  if ( nargin < 3 )
    c = zeros ( m, 1 );
  else
    c = c(:);
  end

  if ( nargin < 4 )
    r = 1.0;
  end
%
%  Choose random points within the cube of radius 1.
%
  x = 2.0 * rand ( m, n ) - 1.0;
%
%  For each point, select a coordinate at random, and set it to +1 or -1.
%
  i = randi ( [ 1, m ], 1, n );
  j = 1 : n;
  k = i + ( j - 1 ) * m;
  s = 2.0 * randi ( [ 0, 1 ], 1, n ) - 1.0;
  x(k) = s;
%
%  Scale by R and shift by C.
%
  x = repmat ( c, 1, n ) + r * x;

  return
end
