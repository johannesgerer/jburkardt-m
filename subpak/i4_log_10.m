function value = i4_log_10 ( i )

%*****************************************************************************80
%
%% I4_LOG_10 returns the integer part of the logarithm base 10 of ABS(X).
%
%  Example:
%
%        I  VALUE
%    -----  --------
%        0    0
%        1    0
%        2    0
%        9    0
%       10    1
%       11    1
%       99    1
%      100    2
%      101    2
%      999    2
%     1000    3
%     1001    3
%     9999    3
%    10000    4
%
%  Discussion:
%
%    I4_LOG_10 ( I ) + 1 is the number of decimal digits in I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose logarithm base 10 is desired.
%
%    Output, integer VALUE, the integer part of the logarithm base 10 of
%    the absolute value of X.
%
  i = floor ( i );

  if ( i == 0 )

    value = 0;

  else

    value = 0;
    ten_pow = 10;

    i_abs = abs ( i );

    while ( ten_pow <= i_abs )
      value = value + 1;
      ten_pow = ten_pow * 10;
    end

  end

  return
end
