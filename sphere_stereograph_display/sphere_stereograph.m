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
%    Input, real P(3,N), a set of points on the unit sphere.
%
%    Output, real Q(3,N), the coordinates of the image points,
%
  n = size ( p, 2 );
  q = zeros ( 3, n );
  
  q(1,1:n) =  2.0 * p(1,1:n) ./ ( 1.0 + p(3,1:n) );
  q(2,1:n) =  2.0 * p(2,1:n) ./ ( 1.0 + p(3,1:n) );
  q(3,1:n) =  1.0;

  return
end
