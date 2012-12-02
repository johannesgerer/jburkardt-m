function value = halfplane_contains_point_2d ( p1, p2, p )

%*****************************************************************************80
%
%% HALFPLANE_CONTAINS_POINT_2D reports if a half-plane contains a point in 2d.
%
%  Discussion:
%
%    The halfplane is assumed to be all the points "to the left" of the
%    line that passes from P1 through P2.  Thus, one way to
%    understand where the point P = (X,Y) is, is to compute the signed
%    area of the triangle ( P1, P2, P ).
%
%    If this area is
%      positive, the point is strictly inside the halfplane,
%      zero, the point is on the boundary of the halfplane,
%      negative, the point is strictly outside the halfplane.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), two distinct points
%    on the line defining the half plane.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, logical VALUE, is TRUE if the halfplane
%    contains the point.
%
  area_signed = 0.5 * ...
    ( p1(1,1) * ( p2(2,1) - p(2,1)  ) ...
    + p2(1,1) * ( p(2,1)  - p1(2,1) ) ...
    + p(1,1)  * ( p1(2,1) - p2(2,1) ) );

  value = ( 0.0 <= area_signed );

  return
end
