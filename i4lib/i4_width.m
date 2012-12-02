function value = i4_width ( i )

%*****************************************************************************80
%
%% I4_WIDTH returns the "width" of an integer.
%
%  Example:
%
%        I  VALUE
%    -----  -------
%    -1234    5
%     -123    4
%      -12    3
%       -1    2
%        0    1
%        1    1
%       12    2
%      123    3
%     1234    4
%    12345    5
%
%  Discussion:
%
%    The width of an integer is the number of characters necessary to print it.
%
%    The width of an integer can be useful when setting the appropriate output
%    format for a vector or array of values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number whose width is desired.
%
%    Output, integer VALUE, the number of characters necessary to represent
%    the integer in base 10, including a negative sign if necessary.
%
  if ( 0 <= i )
    value = i4_log_10 ( i ) + 1;
  else
    value = i4_log_10 ( i ) + 2;
  end

  return
end
