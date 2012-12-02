function w = vector_rotate_2d ( v, angle )

%*****************************************************************************80
%
%% VECTOR_ROTATE_2D rotates a vector around the origin in 2D.
%
%  Discussion:
%
%    To see why this formula is so, consider that the original point
%    has the form ( R cos Theta, R sin Theta ), and the rotated point
%    has the form ( R cos ( Theta + Angle ), R sin ( Theta + Angle ) ).
%    Now use the addition formulas for cosine and sine to relate
%    the new point to the old one:
%
%      ( W1 ) = ( cos Angle  - sin Angle ) * ( V1 )
%      ( W2 )   ( sin Angle    cos Angle )   ( V2 )
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
%  Parameters:
%
%    Input, real V(2), the vector to be rotated.
%
%    Input, real ANGLE, the angle, in radians, of the rotation
%    to be carried out.  A positive angle rotates the vector in the
%    counterclockwise direction.
%
%    Output, real W(2), the rotated vector.
%
  w(1) = cos ( angle ) * v(1) - sin ( angle ) * v(2);
  w(2) = sin ( angle ) * v(1) + cos ( angle ) * v(2);

  return
end
