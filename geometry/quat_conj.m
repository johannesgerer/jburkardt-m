function q2 = quat_conj ( q )

%*****************************************************************************80
%
%% QUAT_CONJ conjugates a quaternion.
%
%  Discussion:
%
%    A quaternion is a quadruplet (A,B,C,D) of real numbers, which
%    may be written as
%
%      Q = A + Bi + Cj + Dk.
%
%    The conjugate of Q is
%
%      conj ( Q ) = A - Bi - Cj - Dk.
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
%    Input, real Q(4), the quaternion to be conjugated.
%
%    Output, real Q2(4), the conjugated quaternion.
%
  q2(1) =  q(1);
  q2(2) = -q(2);
  q2(3) = -q(3);
  q2(4) = -q(4);

  return
end
