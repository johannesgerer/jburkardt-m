function p = sphere_stereograph2_inverse ( q, focus, center )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH2_INVERSE computes stereographic preimages of points.
%
%  Discussion:
%
%    We start with a sphere of center C.
%
%    F is a point on the sphere which is the focus of the mapping,
%    and the antipodal point 2*C-F is the point of tangency
%    to the sphere of a plane.
%
%    For any point Q on the plane, the stereographic inverse projection
%    P of the point is defined by drawing the line from F through Q, and
%    computing P as the intersection of this line with the sphere.
%
%    The spatial dimension M is arbitrary, but should be at least 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2010
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
%    Input, real Q(M,N), the points, which are presumed to lie
%    on the plane.
%
%    Input, real FOCUS(M,1), the coordinates of the focus point.
%
%    Input, real CENTER(M,1), the coordinates of the center of the sphere.
%
%    Output, real P(M,N), the stereographic inverse projections of the points.
%
  [ m, n ] = size ( q );

  ff = repmat ( focus, 1, n );

  s(1,1:n) = 2.0 * ( center - focus )' * ( q - ff ) ./ sum ( ( q - ff ).^2, 1 );

  ss = repmat ( s, m, 1 );

  p = ss .* q + ( 1.0 - ss ) .* ff;

  return
end
