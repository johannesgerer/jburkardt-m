function b = tmat_rot_vector ( a, angle, axis )

%*****************************************************************************80
%
%% TMAT_ROT_VECTOR applies an arbitrary axis rotation to the geometric transformation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics, Principles and Practice,
%    Addison Wesley, Second Edition, 1990.
%
%  Parameters:
%
%    Input, real A(4,4), the current geometric transformation
%    matrix.
%
%    Input, real ANGLE, the angle, in degrees, of the rotation.
%
%    Input, real AXIS(3), the axis vector about which 
%    rotation occurs.  AXIS may not be the zero vector.
%
%    Output, real B(4,4), the modified geometric 
%    transformation matrix.
%
  dim_num = 3;
  
  norm = sqrt ( sum ( axis(1:dim_num).^2 ) );

  if ( norm == 0.0 )
    return
  end

  axis(1:dim_num) = axis(1:dim_num) / norm;

  angle_rad = degrees_to_radians ( angle );
  ca = cos ( angle_rad );
  sa = sin ( angle_rad );

  c = tmat_init ( );

  c(1,1) =                axis(1) * axis(1) + ca * ( 1.0 - axis(1) * axis(1) );
  c(1,2) = ( 1.0 - ca ) * axis(1) * axis(2) - sa * axis(3);
  c(1,3) = ( 1.0 - ca ) * axis(1) * axis(3) + sa * axis(2);

  c(2,1) = ( 1.0 - ca ) * axis(2) * axis(1) + sa * axis(3);
  c(2,2) =                axis(2) * axis(2) + ca * ( 1.0 - axis(2) * axis(2) );
  c(2,3) = ( 1.0 - ca ) * axis(2) * axis(3) - sa * axis(1);

  c(3,1) = ( 1.0 - ca ) * axis(3) * axis(1) - sa * axis(2);
  c(3,2) = ( 1.0 - ca ) * axis(3) * axis(2) + sa * axis(1);
  c(3,3) =                axis(3) * axis(3) + ca * ( 1.0 - axis(3) * axis(3) );

  b(1:4,1:4) = c(1:4,1:4) * a(1:4,1:4);

  return
end
