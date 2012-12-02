function value = i4_bit_lo1 ( n )

%*****************************************************************************80
%
%% I4_BIT_LO1 returns the position of the low 1 bit base 2 in an integer.
%
%  Example:
%
%       N    Binary    Lo 1
%    ----    --------  ----
%       0           0     0
%       1           1     1
%       2          10     2
%       3          11     1
%       4         100     3
%       5         101     1
%       6         110     2
%       7         111     1
%       8        1000     4
%       9        1001     1
%      10        1010     2
%      11        1011     1
%      12        1100     3
%      13        1101     1
%      14        1110     2
%      15        1111     1
%      16       10000     5
%      17       10001     1
%    1023  1111111111     1
%    1024 10000000000    11
%    1025 10000000001     1
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
%    Input, integer N, the integer to be measured.
%    N should be nonnegative.
%
%    Output, integer I4_BIT_LO1, the position of the low 1 bit.
%
  bit = 0;
  i = n;

  while ( 1 )

    bit = bit + 1;
    i2 = floor ( i / 2 );

    if ( i ~= 2 * i2 )
      break
    end

    i = i2;

  end

  value = bit;

  return
end
