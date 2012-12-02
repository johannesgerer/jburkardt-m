function q = sphere_stereograph ( p )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH computes the stereographic image of points on a sphere.
%
%  Discussion:
%
%    We start with a sphere of radius 1 and center (0,0,0).
%
%    The north pole N = (0,0,1) is the point of tangency to the sphere 
%    of a plane, and the south pole S = (0,0,-1) is the focus for the 
%    stereographic projection.
%
%    For any point P on the sphere, the stereographic projection Q of the
%    point is defined by drawing the line from S through P, and computing
%    Q as the intersection of this line with the plane.
%
%    Actually, we allow the spatial dimension M to be arbitrary.  Values
%    of M make sense starting with 2.  The north and south poles are
%    selected as the points (0,0,...,+1) and (0,0,...,-1).
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
%    Output, real Q(M,N), the coordinates of the image points,
%
  [ m, n ] = size ( p );

  s(1,1:n) = 2.0 ./ ( 1.0 + p(m,1:n) );
  ss = repmat ( s, m, 1 );

  f = zeros(m,1);
  f(m) = -1.0;
  ff = repmat ( f, 1, n );

  q(1:m,1:n) = ss .* p + ( 1.0 - ss ) .* ff;

  return
end
