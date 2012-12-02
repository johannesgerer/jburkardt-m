function w = rotation_axis_vector_3d ( axis, angle, v )

%*****************************************************************************80
%
%% ROTATION_AXIS_VECTOR_3D rotates a vector around an axis vector in 3D.
%
%  Discussion:
%
%    Thanks to Cody Farnell for correcting some mistakes in an earlier
%    version of this routine.
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
%    Input, real AXIS(3), the axis vector for the rotation.
%
%    Input, real ANGLE, the angle, in radians, of the rotation.
%
%    Input, real V(3), the vector to be rotated.
%
%    Output, real W(3), the rotated vector.
%
  dim_num = 3;
%
%  These row/column idiocies are driving me nuts!
%  I just want V to be a vector like U.  
%  Since U is a row vector, please God, make V be one too!
%
  if ( size ( v, 2 ) == 1 )
    v = v';
  end
%
%  Compute the length of the rotation axis.
%
  u(1:dim_num) = axis(1:dim_num);

  axis_norm = sqrt ( sum ( u(1:dim_num).^2 ) );

  if ( axis_norm == 0.0 )
    w(1:dim_num) = 0.0;
    return
  end

  u(1:dim_num) = u(1:dim_num) / axis_norm;
%
%  Compute the dot product of the vector and the rotation axis.
%
  dot = u(1:dim_num) * v(1:dim_num)';
%
%  Compute the parallel component of the vector.
%
  parallel(1:dim_num) = dot * u(1:dim_num);
%
%  Compute the normal component of the vector.
%
  normal(1:dim_num) = v(1:dim_num) - parallel(1:dim_num);

  normal_component = sqrt ( sum ( ( normal(1:dim_num) ).^2 ) );

  if ( normal_component == 0.0 )
    w(1:dim_num) = parallel(1:dim_num);
    return
  end

  normal(1:dim_num) = normal(1:dim_num) / normal_component;
%
%  Compute a second vector, lying in the plane, perpendicular
%  to V, and forming a right-handed system, as the cross product
%  of the first two vectors.
%
  normal2(1) = u(2) * normal(3) - u(3) * normal(2);
  normal2(2) = u(3) * normal(1) - u(1) * normal(3);
  normal2(3) = u(1) * normal(2) - u(2) * normal(1);

  norm = sqrt ( sum ( ( normal2(1:dim_num) ).^2 ) );

  normal2(1:dim_num) = normal2(1:dim_num) / norm;
%
%  Rotate the normal component by the angle.
%
  rot(1:dim_num) = normal_component * ( ...
      cos ( angle ) * normal(1:dim_num) ...
    + sin ( angle ) * normal2(1:dim_num) );
%
%  The rotated vector is the parallel component plus the rotated component.
%
  w(1:dim_num) = parallel(1:dim_num) + rot(1:dim_num);

  return
end
