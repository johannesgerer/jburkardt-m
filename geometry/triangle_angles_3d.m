function angle = triangle_angles_3d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ANGLES_3D computes the angles of a triangle in 3D.
%
%  Discussion:
%
%    The law of cosines is used:
%
%      C * C = A * A + B * B - 2 * A * B * COS ( GAMMA )
%
%    where GAMMA is the angle opposite side C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(DIM_NUM,3), the triangle vertices.
%
%    Output, real ANGLE(3,1), the angles opposite
%    sides P1-P2, P2-P3 and P3-P1, in radians.
%

%
%  Compute the length of each side.
%
  a = sqrt ( sum ( ( t(1:3,1) - t(1:3,2) ).^2 ) );
  b = sqrt ( sum ( ( t(1:3,2) - t(1:3,3) ).^2 ) );
  c = sqrt ( sum ( ( t(1:3,3) - t(1:3,1) ).^2 ) );

  angle = zeros ( 3, 1 );
%
%  Take care of a special case.
%
  if ( a == 0.0 & b == 0.0 & c == 0.0 )
    angle(1:3,1) = 2.0 * pi / 3.0;
    return
  end

  if ( c == 0.0 | a == 0.0 )
    angle(1,1) = pi;
  else
    angle(1,1) = r8_acos ( ( c * c + a * a - b * b ) / ( 2.0 * c * a ) );
  end

  if ( a == 0.0 | b == 0.0 )
    angle(2,1) = pi;
  else
    angle(2,1) = r8_acos ( ( a * a + b * b - c * c ) / ( 2.0 * a * b ) );
  end

  if ( b == 0.0 | c == 0.0 )
    angle(3,1) = pi;
  else
    angle(3,1) = r8_acos ( ( b * b + c * c - a * a ) / ( 2.0 * b * c ) );
  end

  return
end
