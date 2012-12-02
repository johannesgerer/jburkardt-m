function v2 = vector_rotate_3d ( v1, axis, angle )

%*****************************************************************************80
%
%% VECTOR_ROTATE_3D rotates a vector around an axis vector in 3D.
%
%  Discussion:
%
%    Thanks to Cody Farnell for correcting some errors in a previous
%    version of this routine!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), the vector to be rotated.
%
%    Input, real AXIS(3), the vector about which the
%    rotation is to be carried out.
%
%    Input, real ANGLE, the angle, in radians, of the rotation
%    to be carried out.
%
%    Output, real V2(3), the rotated vector.
%
  dim_num = 3;
%
%  Compute the length of the rotation axis.
%
  axis_norm = sqrt ( sum ( ( axis(1:dim_num) ).^2 ) );

  if ( axis_norm == 0.0 )
    v2(1:dim_num) = v1(1:dim_num);
    return
  end
%
%  Compute the dot product of the vector and the (unit) rotation axis.
%
  dot = v1(1:dim_num) * axis(1:dim_num)' / axis_norm;
%
%  Compute the parallel component of the vector.
%
  vp(1:dim_num) = dot * axis(1:dim_num) / axis_norm;
%
%  Compute the normal component of the vector.
%
  vn(1:dim_num) = v1(1:dim_num) - vp(1:dim_num);

  normn = sqrt ( sum ( vn(1:dim_num).^2 ) );

  if ( normn == 0.0 )
    v2(1:dim_num) = vp(1:dim_num);
    return
  end

  vn(1:dim_num) = vn(1:dim_num) / normn;
%
%  Compute a second vector, lying in the plane, perpendicular
%  to (X1,Y1,Z1), and forming a right-handed system...
%
  normal2(1) = axis(2) * vn(3) - axis(3) * vn(2);
  normal2(2) = axis(3) * vn(1) - axis(1) * vn(3);
  normal2(3) = axis(1) * vn(2) - axis(2) * vn(1);

  normal2 = vector_unit_nd ( dim_num, normal2 );
%
%  Rotate the normal component by the angle.
%
  vr(1:dim_num) = normn * ( ...
      cos ( angle ) * vn(1:dim_num) ...
    + sin ( angle ) * normal2(1:dim_num) );
%
%  The rotated vector is the parallel component plus the rotated
%  component.
%
  v2(1:dim_num) = vp(1:dim_num) + vr(1:dim_num);

  return
end
