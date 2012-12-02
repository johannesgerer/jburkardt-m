function qr = plane_normal_xyz_to_qr ( pp, normal, pq, pr, n, xyz )

%*****************************************************************************80
%
%% PLANE_NORMAL_XYZ_TO_QR: XYZ to QR coordinates for a normal form plane.
%
%  Discussion:
%
%    The normal form of a plane in 3D is:
%
%      PP is a point on the plane,
%      NORMAL is a normal vector to the plane.
%
%    Two vectors PQ and PR can be computed with the properties that
%    * NORMAL, PQ and PR are pairwise orthogonal;
%    * PQ and PR have unit length;
%    * every point P in the plane has a "QR" representation
%      as P = PP + q * PQ + r * PR.
%
%    This function is given the XYZ coordinates of a set of points on the
%    plane, and returns the QR coordinates.
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
%  Parameters:
%
%    Input, real PP(3), a point on the plane.
%
%    Input, real NORMAL(3), a normal vector N to the plane.  The
%    vector must not have zero length, but it is not necessary for N
%    to have unit length.
%
%    Input, real PQ(3), a vector of unit length,
%    perpendicular to the vector N and the vector PR.
%
%    Input, real PR(3), a vector of unit length,
%    perpendicular to the vector N and the vector PQ.
%
%    Input, integer N, the number of points on the plane.
%
%    Input, real XYZ(3,N), the XYZ coordinates of the points.
%
%    Output, real QR(2,N), the QR coordinates of the points.
%
  qr = [ pq'; pr' ] * ( xyz(1:3,1:n) - repmat ( pp, 1, n ) );

  return
end
