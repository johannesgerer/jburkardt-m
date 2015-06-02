function value = i4_log_r8 ( x, b )

%*****************************************************************************80
%
%% I4_LOG_R8 returns the integer part of the logarithm base ABS(B) of ABS(X).
%
%  Example:
%
%    If B is greater than 1, and X is positive:
%
%    if 1/B^2  <  X <= 1/B   I4_LOG_R8(X) = -1,
%    if 1/B    <  X <= 1     I4_LOG_R8(X) = 0,
%    if 1      <= X <  B,    I4_LOG_R8(X) = 0,
%    if B      <= X <  B^2   I4_LOG_R8(X) = 1,
%    if B^2    <= X <  B^3   I4_LOG_R8(X) = 2.
%
%    For positive I4_LOG_R8(X), it should be true that
%
%      ABS(B)^I4_LOG_R8(X) <= ABS(X) < ABS(B)^(I4_LOG_R8(X)+1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the number whose logarithm base B is desired.
%    If X is 0, then I4_LOG_R8 is returned as -HUGE().
%
%    Input, real B, the absolute value of the base of the
%    logarithms.  B must not be -1, 0, or 1.
%
%    Output, integer VALUE, the integer part of the logarithm
%    base abs(B) of X.
%
  i4_huge = 2147483647;

  x = floor ( x );

  if ( x == 0 )
    value = - i4_huge;
    return
  end

  b = abs ( b );
  value = 0;

  if ( b == 1.0 )
    return
  end

  if ( b == 0.0 )
    return
  end

  x = abs ( x );

  if ( b < 1.0 )
    value_sign = -1;
    b = 1.0 / b;
  else
    value_sign = +1;
  end

  if ( 1.0 <= x && x < b )
    value = value_sign * value;
    return
  end 

  while ( b < x )
    x = x / b;
    value = value + 1;
  end

  while ( x * b <= 1.0 )
    x = x * b;
    value = value - 1;
  end
%
%  If the absolute value of the base was less than 1, we inverted
%  earlier.  Now negate the logarithm to account for that.
%
  value = value_sign * value;

  return
end
