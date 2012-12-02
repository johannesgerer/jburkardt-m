function value = i4_lcm ( i, j )

%*****************************************************************************80
%
%% I4_LCM computes the least common multiple of two integers.
%
%  Discussion:
%
%    The least common multiple may be defined as
%
%      LCM(I,J) = ABS( I * J ) / GCD(I,J)
%
%    where GCD(I,J) is the greatest common divisor of I and J.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the integers whose LCM is desired.
%
%    Output, integer VALUE, the least common multiple of I and J.
%    VALUE is never negative.  VALUE is 0 if either I or J is zero.
%
  value = abs ( i * ( j / i4_gcd ( i, j ) ) );

  return
end
