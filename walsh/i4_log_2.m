function value = i4_log_2 ( i )

%*****************************************************************************80
%
%% I4_LOG_2 returns the integer part of the logarithm base 2 of |I|.
%
%  Discussion:
%
%    For positive I4_LOG_2(I), it should be true that
%      2^I4_LOG_2(X) <= |I| < 2^(I4_LOG_2(I)+1).
%    The special case of I4_LOG_2(0) returns -HUGE().
%
%  Example:
%
%     I  Value
%
%     0  -1
%     1,  0
%     2,  1
%     3,  1
%     4,  2
%     5,  2
%     6,  2
%     7,  2
%     8,  3
%     9,  3
%    10,  3
%   127,  6
%   128,  7
%   129,  7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose logarithm base 2 is desired.
%
%    Output, integer VALUE, the integer part of the logarithm base 2 of
%    the absolute value of I.
%
  i = floor ( i );

  if ( i == 0 )

    value = -Inf;

  else

    value = 0;

    i = abs ( i );

    while ( 2 <= i )
      i = i / 2;
      value = value + 1;
    end

  end

  return
end
