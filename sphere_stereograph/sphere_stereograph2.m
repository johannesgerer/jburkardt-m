function q = sphere_stereograph2 ( p, focus, center )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH2 computes the stereographic image of points on a sphere.
%
%  Discussion:
%
%    We start with a sphere of center C.
%
%    F is a point on the sphere which is the focus of the mapping,
%    and the antipodal point 2*C-F is the point of tangency
%    to the sphere of a plane.
%
%    For any point P on the sphere, the stereographic projection Q of the
%    point is defined by drawing the line from F through P, and computing
%    Q as the intersection of this line with the plane.
%
%    The spatial dimension M is arbitrary, but should be at least 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    C F Marcus,
%    The stereographic projection in vector notation,
%    Mathematics Magazine,
%    Volume 39, Number 2, March 1966, pages 100-102.
%
%  Parameters:
%
%    Input, real P(M,N), a set of points on the unit sphere.
%
%    Input, real FOCUS(M,1), the coordinates of the focus point.
%
%    Input, real CENTER(M,1), the coordinates of the center of the sphere.
%
%    Output, real Q(M,N), the coordinates of the image points,
%
  [ m, n ] = size ( p );

  ff = repmat ( focus, 1, n );

  s(1,1:n) = 2.0 * sum ( ( center - focus ).^2 ) ...
    ./ ( ( center - focus )' * ( p - ff ) );

  ss = repmat ( s, m, 1 );

  q = ss .* p + ( 1.0 - ss ) .* ff;

  return
end
