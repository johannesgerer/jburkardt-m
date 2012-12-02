function p = sphere_stereograph_inverse ( q )

%*****************************************************************************80
%
%% SPHERE_STEREOGRAPH_INVERSE computes stereographic preimages of points.
%
%  Discussion:
%
%    We start with a sphere of radius 1 and center (0,0,0).
%
%    The north pole N = (0,0,1) is the point of tangency to the sphere 
%    of a plane, and the south pole S = (0,0,-1) is the focus for the 
%    stereographic projection.
%
%    For any point Q on the plane, the stereographic inverse projection
%    P of the point is defined by drawing the line from S through Q, and 
%    computing P as the intersection of this line with the sphere.
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
%    Input, real Q(M,N), the points, which are presumed to lie 
%    on the plane Z = 1.
%
%    Output, real P(M,N), the stereographic inverse projections of the points.
%
  [ m, n ] = size ( q );

  f = [ 0, 0, -1 ]';
  ff = repmat ( f, 1, n );

  s(1,1:n) = 4.0 ./ ( 4.0 + sum ( q(1:m-1,1:n).^2, 1 ) );
  ss = repmat ( s, m, 1 );

  p(1:m,1:n) = ss .* q(1:m,1:n) + ( 1.0 - ss ) .* ff(1:m,1:n);

  return
end
