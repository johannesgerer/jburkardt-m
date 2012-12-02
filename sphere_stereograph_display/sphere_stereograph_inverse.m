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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 November 2010
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
%    Input, real Q(3,N), the points, which are presumed to lie 
%    on the plane Z = 1.
%
%    Output, real P(3,N), the stereographic inverse projections of the points.
%
  n = size ( q, 2 );

  e = zeros ( 2, n );
  e(1,1:n) = q(1,1:n);
  e(2,1:n) = q(2,1:n);

  ee(1,1:n) = e(1,1:n).^2 + e(2,1:n).^2;

  p = zeros ( 3, n );
  p(1,1:n) = 4.0 * e(1,1:n)      ./ ( 4.0 + ee(1,1:n) );
  p(2,1:n) = 4.0 * e(2,1:n)      ./ ( 4.0 + ee(1,1:n) );
  p(3,1:n) = ( 4.0 - ee(1,1:n) ) ./ ( 4.0 + ee(1,1:n) );

  return
end
