function value = angle_rad ( p1, p2, p3 )

%*****************************************************************************80
%
%% ANGLE_RAD returns the angle swept out between two rays.
%
%  Discussion:
%
%    Except for the zero angle case, it should be true that
%
%      ANGLE_RAD(P1,P2,P3) + ANGLE_RAD(P3,P2,P1) = 2 * PI
%
%        P1
%        /
%       /
%      /
%     /
%    P2--------->P3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2,1), P2(2,1), P3(2,1), define the rays
%    P1 - P2 and P3 - P2 which in turn define the angle.
%
%    Output, real VALUE, the angle swept out by the rays, measured
%    in radians.  0 <= VALUE < 2*PI.  If either ray has zero length,
%    then VALUE is set to 0.
%
  p(1,1) = ( p3(1,1) - p2(1,1) ) * ( p1(1,1) - p2(1,1) ) ...
         + ( p3(2,1) - p2(2,1) ) * ( p1(2,1) - p2(2,1) );

  p(2,1) = ( p3(1,1) - p2(1,1) ) * ( p1(2,1) - p2(2,1) ) ...
         - ( p3(2,1) - p2(2,1) ) * ( p1(1,1) - p2(1,1) );

  if ( p(1,1) == 0.0 & p(2,1) == 0.0 )
    value = 0.0;
    return
  end

  value = atan2 ( p(2,1), p(1,1) );

  if ( value < 0.0 )
    value = value + 2.0 * pi;
  end

  return
end
