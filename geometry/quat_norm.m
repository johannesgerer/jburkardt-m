function value = quat_norm ( q )

%*****************************************************************************80
%
%% QUAT_NORM computes the norm of a quaternion.
%
%  Discussion:
%
%    A quaternion is a quadruplet (A,B,C,D) of real numbers, which
%    may be written as
%
%      Q = A + Bi + Cj + Dk.
%
%    The norm of Q is
%
%      norm(Q) = sqrt ( A**2 + B**2 + C**2 + D**2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Q(4), the quaternion.
%
%    Output, real VALUE, the norm of the quaternion.
%
  value = sqrt ( sum ( q(1:4).^2 ) );

  return
end
