function angle = planes_imp_angle_3d ( a1, b1, c1, d1, a2, b2, c2, d2 )

%*****************************************************************************80
%
%% PLANES_IMP_ANGLE_3D: dihedral angle between implicit planes in 3D.
%
%  Discussion:
%
%    The implicit form of a plane in 3D is:
%
%      A * X + B * Y + C * Z + D = 0
%
%    If two planes P1 and P2 intersect in a nondegenerate way, then there is a
%    line of intersection L0.  Consider any plane perpendicular to L0.  The
%    dihedral angle of P1 and P2 is the angle between the lines L1 and L2, where
%    L1 is the intersection of P1 and P0, and L2 is the intersection of P2 
%    and P0.
%
%    The dihedral angle may also be calculated as the angle between the normal
%    vectors of the two planes.  Note that if the planes are parallel or
%    coincide, the normal vectors are identical, and the dihedral angle is 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Math Tables and Formulae, 30th edition,
%    Section 4.13, "Planes",
%    CRC Press, 1996, pages 305-306.
%
%  Parameters:
%
%    Input, real A1, B1, C1, D1, coefficients that define the
%    first plane.
%
%    Input, real A2, B2, C2, D2, coefficients that define
%    the second plane.
%
%    Output, real ANGLE, the dihedral angle, in radians,
%    defined by the two planes.  If either plane is degenerate, or they
%    do not intersect, or they coincide, then the angle is set to Inf.
%    Otherwise, the angle is between 0 and PI.
%
  dim_num = 3;

  norm1 = sqrt ( a1 * a1 + b1 * b1 + c1 * c1 );

  if ( norm1 == 0.0 )
    angle = Inf;
    return
  end

  norm2 = sqrt ( a2 * a2 + b2 * b2 + c2 * c2 );

  if ( norm2 == 0.0 )
    angle = Inf;
    return
  end

  cosine = ( a1 * a2 + b1 * b2 + c1 * c2 ) / ( norm1 * norm2 );

  angle = r8_acos ( cosine );

  return
end

