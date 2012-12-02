function vs = sphere01_triangle_vertices_to_centroid ( v1, v2, v3 )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_VERTICES_TO_CENTROID gets a spherical triangle centroid.
%
%  Discussion:
%
%    A unit sphere centered at 0 in 3D satisfies the equation:
%
%      X*X + Y*Y + Z*Z = 1
%
%    A spherical triangle is specified by three points on the sphere.
%
%    The (true) centroid of a spherical triangle is the point
%
%      VT = (XT,YT,ZT) = Integral ( X, Y, Z ) dArea / Integral 1 dArea
%
%    Note that the true centroid does NOT, in general, lie on the sphere.  
%
%    The "flat" centroid VF is the centroid of the planar triangle defined by
%    the vertices of the spherical triangle.
%
%    The "spherical" centroid VS of a spherical triangle is computed by
%    the intersection of the geodesic bisectors of the triangle angles.
%    The spherical centroid lies on the sphere.
%
%    VF, VT and VS lie on a line through the center of the sphere.  We can
%    easily calculate VF by averaging the vertices, and from this determine
%    VS by normalizing.
%
%    Of course, we still will not have actually computed VT, which lies
%    somewhere between VF and VS!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the vertices of the triangle.
%
%    Output, real VS(3), the coordinates of the "spherical
%    centroid" of the spherical triangle.
%
  vs(1:3) = ( v1(1:3) + v2(1:3) + v3(1:3) ) / 3.0;

  norm = sqrt ( sum ( vs(1:3).^2 ) );

  vs(1:3) = vs(1:3) / norm;

  return
end
