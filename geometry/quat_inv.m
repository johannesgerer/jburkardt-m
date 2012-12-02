function q2 = quat_inv ( q )

%*****************************************************************************80
%
%% QUAT_INV inverts a quaternion.
%
%  Discussion:
%
%    A quaternion is a quadruplet (A,B,C,D) of real numbers, which
%    may be written as
%
%      Q = A + Bi + Cj + Dk.
%
%    The inverse of Q is
%
%      inverse ( Q ) = conjugate ( Q ) / ( norm ( Q ) )**2.
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
%    Input, real Q(4), the quaternion to be inverted.
%
%    Output, real Q2(4), the inverse of the input quaternion.
%
  q2(1:4) = q(1:4) / sum ( q(1:4).^2 );
  q2(2:4) = -q2(2:4);

  return
end
