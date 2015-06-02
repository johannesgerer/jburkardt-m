function x = sphere_surface_sample ( m, n, c, r )

%*****************************************************************************80
%
%% SPHERE_SURFACE_SAMPLE returns random points on the surface of a sphere.
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
%    random from the surface of the M-sphere of center C and radius R.
%
  if ( nargin < 3 )
    c = zeros ( m, 1 );
  else
    c = c(:);
  end

  if ( nargin < 4 )
    r = 1.0;
  end

  x = randn ( m, n );
  v(1,1:n) = sqrt ( sum ( x.^2, 1 ) );
  vv = repmat ( v, m, 1 );
  x = repmat ( c, 1, n ) + r * x ./ vv;

  return
end
