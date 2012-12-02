function [ pr, pq ] = plane_normal_basis_3d ( pp, normal )

%*****************************************************************************80
%
%% PLANE_NORMAL_BASIS_3D finds two perpendicular vectors in a plane in 3D.
%
%  Discussion:
%
%    The normal form of a plane in 3D is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The two vectors to be computed, PQ and PR, can be regarded as
%    the basis of a Cartesian coordinate system for points in the plane.
%    Any point in the plane can be described in terms of the "origin"
%    point PP plus a weighted sum of the two vectors PQ and PR:
%
%      P = PP + a * PQ + b * PR.
%
%    The vectors PQ and PR have unit length, and are perpendicular to N
%    and to each other.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PP(3), a point on the plane.  (Actually,
%    we never need to know these values to do the calculation!)
%
%    Input, real NORMAL(3), a normal vector N to the plane.  The
%    vector must not have zero length, but it is not necessary for N
%    to have unit length.
%
%    Output, real PR(3), a vector of unit length,
%    perpendicular to the vector N and the vector PQ.
%
%    Output, real PQ(3), a vector of unit length,
%    perpendicular to the vector N and the vector PR.
%
  dim_num = 3;
%
%  Compute the length of NORMAL.
%
  normal_norm = norm ( normal );

  if ( normal_norm == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANE_NORMAL_BASIS_3D - Fatal error!\n' );
    fprintf ( 1, '  The normal vector is 0.\n' );
    error ( 'PLANE_NORMAL_BASIS_3D - Fatal error!' );
  end
%
%  Find a vector PQ that is normal to NORMAL and has unit length.
%
  pq = r8vec_any_normal ( dim_num, normal );
%
%  Now just take the cross product NORMAL x PQ to get the PR vector.
%
  pr = r8vec_cross_product_3d ( normal, pq );

  pr_norm = norm ( pr );

  pr(1:dim_num) = pr(1:dim_num) / pr_norm;

  return
end
