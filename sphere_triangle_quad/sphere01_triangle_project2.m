function node_xyz = sphere01_triangle_project2 ( a_xyz, b_xyz, c_xyz, f1, ...
  f2, f3 )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_PROJECT2 projects from plane to spherical triangle.
%
%  Discussion:
%
%    We assume that points A, B and C lie on the unit sphere, and they
%    thus define a spherical triangle.
%
%    They also, of course, define a planar triangle.
%
%    Let (F1,F2,F3) be the barycentric coordinates of a point in this 
%    planar triangle.
%
%    This function determines the coordinates of the point in the planar
%    triangle identified by the barycentric coordinates, and returns the
%    coordinates of the projection of that point onto the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A_XYZ(3), B_XYZ(3), C_XYZ(3), the coordinates
%    of the points A, B, and C.
%
%    Input, integer F1, F2, F3, the barycentric coordinates
%    of a point in the triangle ABC.  Normally, these coordinates would
%    be real numbers, and would sum to 1.  For convenience, we allow these
%    to be integers which must be divided by F1+F2+F3.
%
%    Output, real NODE_XYZ(3), the coordinates of the 
%    point on the unit sphere which is the projection of the point on the 
%    plane whose barycentric coordinates with respect to A, B, and C is
%    (F1,F2,F3)/(F1+F2+F3).
%

%
%  Destroy all row vectors!
%
  a_xyz = a_xyz(:);
  b_xyz = b_xyz(:);
  c_xyz = c_xyz(:);
%
%  This check avoids 0/0 calculations later.
%
  if ( f2 == 0 && f3 == 0 )
    node_xyz(1:3) = a_xyz(1:3);
    return
  elseif ( f1 == 0 && f3 == 0 )
    node_xyz(1:3) = b_xyz(1:3);
    return
  elseif ( f1 == 0 && f2 == 0 )
    node_xyz(1:3) = c_xyz(1:3);
    return
  end
%
%  Determine the angular distances (A,B) and (A,C).
%
  theta_ab = sphere01_distance_xyz ( a_xyz, b_xyz );

  theta_ac = sphere01_distance_xyz ( a_xyz, c_xyz );
%
%  Polarize B = BP + BN
%  Normalize BN, 
%  Same for C.
%
  [ bn, bp ] = r8vec_polarize ( 3, b_xyz, a_xyz );
  bn(1:3,1) = bn(1:3) / r8vec_norm ( 3, bn );

  [ cn, cp ] = r8vec_polarize ( 3, c_xyz, a_xyz );
  cn(1:3,1) = cn(1:3) / r8vec_norm ( 3, cn );
%
%  Determine AB and AC that use cos ( ( F2 + F3 ) / ( F1 + F2 + F3 ) ) of A
%  and cos ( F1 / ( F1 + F2 + F3 ) ) of B or C.
%
  angle = ( ( f2 + f3 ) * theta_ab ) / ( f1 + f2 + f3 );
  ab(1:3,1) = cos ( angle ) * a_xyz(1:3) + sin ( angle ) * bn(1:3);

  angle = ( ( f2 + f3 ) * theta_ac ) / ( f1 + f2 + f3 );
  ac(1:3,1) = cos ( angle ) * a_xyz(1:3) + sin ( angle ) * cn(1:3);
%
%  Determine the angular distance between AB and AC.
%
  theta_bc = sphere01_distance_xyz ( ab(1:3), ac(1:3) );
%
%  Polarize AC = ACP + ACN, normalize ACN.
%
  [ acn, acp ] = r8vec_polarize ( 3, ac, ab );
  acn(1:3,1) = acn(1:3) / r8vec_norm ( 3, acn );
%
%  The interval between AB and AC is marked by F2+F3+1 vertices 0 through F2+F3.
%
  angle = ( f3 * theta_bc ) / ( f2 + f3 );

  node_xyz(1:3,1) = cos ( angle ) * ab(1:3) + sin ( angle ) * acn(1:3);

  return
end