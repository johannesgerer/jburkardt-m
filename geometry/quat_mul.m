function q3 = quat_mul ( q1, q2 )

%*****************************************************************************80
%
%% QUAT_MUL multiplies two quaternions.
%
%  Discussion:
%
%    A quaternion is a quadruplet (A,B,C,D) of real numbers, which
%    may be written as
%
%      Q = A + Bi + Cj + Dk.
%
%    To multiply two quaternions, use the relationships:
%
%      i * j = -j * i = k
%      j * k = -k * j = i
%      k * i = -i * k = j
%      i * i =  j * j = k * k = -1
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
%    Input, real Q1(4), Q2(4), the two quaternions to be multiplied.
%
%    Output, real Q3(4), the product of the two quaternions.
%
  q3(1) = q1(1) * q2(1) - q1(2) * q2(2) - q1(3) * q2(3) - q1(4) * q2(4);
  q3(2) = q1(1) * q2(2) + q1(2) * q2(1) + q1(3) * q2(4) - q1(4) * q2(3);
  q3(3) = q1(1) * q2(3) - q1(2) * q2(4) + q1(3) * q2(1) + q1(4) * q2(2);
  q3(4) = q1(1) * q2(4) + q1(2) * q2(3) - q1(3) * q2(2) + q1(4) * q2(1);

  return
end
