function value = angle_rad_3d ( p1, p2, p3 )

%*****************************************************************************80
%
%% ANGLE_RAD_3D returns the angle in radians between two rays in 3D.
%
%  Discussion:
%
%    The routine always computes the SMALLER of the two angles between
%    two rays.  Thus, if the rays make an (exterior) angle of
%    1.5 pi radians, the (interior) angle of 0.5 pi radians will be reported.
%
%    X dot Y = Norm(X) * Norm(Y) * Cos ( Angle(X,Y) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), points defining an angle.
%    The rays are P1 - P2 and P3 - P2.
%
%    Output, real VALUE, the angle between the two rays,
%    in radians.  This value will always be between 0 and PI.  If either ray has
%    zero length, then the angle is returned as zero.
%
  dim_num = 3;

  v1norm = sqrt ( sum ( ( p2(1:dim_num) - p1(1:dim_num) ).^2 ) );

  if ( v1norm == 0.0 )
    value = 0.0;
    return
  end

  v2norm = sqrt ( sum ( ( p2(1:dim_num) - p3(1:dim_num) ).^2 ) );

  if ( v2norm == 0.0 )
    value = 0.0;
    return
  end

  dot = ( p1(1:dim_num) - p2(1:dim_num) ) * ( p3(1:dim_num) - p2(1:dim_num) )';

  value = r8_acos ( dot / ( v1norm * v2norm ) );

  return
end
