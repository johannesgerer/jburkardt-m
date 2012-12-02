function p2 = vector_rotate_base_2d ( p1, pb, angle )

%*****************************************************************************80
%
%% VECTOR_ROTATE_BASE_2D rotates a vector around a base point in 2D.
%
%  Discussion:
%
%    The original vector is P1-PB, and the rotated vector is P2-PB.
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
%    Input, real P1(2,1), the endpoint of the original vector.
%
%    Input, real PB(2,1), the location of the base point.
%
%    Input, real ANGLE, the angle, in radians, of the rotation to be
%    carried out.  A positive angle rotates the vector in the
%    counterclockwise direction.
%
%    Output, real P2(2,1), the endpoint of the rotated vector.
%
  p2(1,1) = pb(1,1) + cos ( angle ) * ( p1(1,1) - pb(1,1) ) ...
                    - sin ( angle ) * ( p1(2,1) - pb(2,1) );
  p2(2,1) = pb(2,1) + sin ( angle ) * ( p1(1,1) - pb(1,1) ) ...
                    + cos ( angle ) * ( p1(2,1) - pb(2,1) );

  return
end
