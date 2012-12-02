function value = g_hofstadter ( n )

%*****************************************************************************80
%
%% G_HOFSTADTER computes the Hofstadter G sequence.
%
%  Discussion:
%
%    G(N) = 0                      if N = 0
%         = N - G ( G ( N - 1 ) ), otherwise.
%
%    G(N) is defined for all nonnegative integers.
%
%    The value of G(N) turns out to be related to the Zeckendorf
%    representation of N as a sum of non-consecutive Fibonacci numbers.
%    To compute G(N), determine the Zeckendorf representation:
%
%      N = sum ( 1 <= I <= M ) F(I)
%
%    and reduce the index of each Fibonacci number by 1:
%
%      G(N) = sum ( 1 <= I <= M ) F(I-1)
%
%    However, this is NOT how the computation is done in this routine.
%    Instead, a straightforward recursive function call is defined
%    to correspond to the definition of the mathematical function.
%
%  Table:
%
%     N  G(N)  Zeckendorf   Decremented
%    --  ----  ----------   -----------
%
%     1   1    1            1
%     2   1    2            1
%     3   2    3            2
%     4   3    3 + 1        2 + 1
%     5   3    5            3
%     6   4    5 + 1        3 + 1
%     7   4    5 + 2        3 + 1
%     8   5    8            5
%     9   6    8 + 1        5 + 1
%    10   6    8 + 2        5 + 1
%    11   7    8 + 3        5 + 2
%    12   8    8 + 3 + 1    5 + 2 + 1
%    13   8    13           8
%    14   9    13 + 1       8 + 1
%    15   9    13 + 2       8 + 1
%    16  10    13 + 3       8 + 2
%    17  11    13 + 3 + 1   8 + 2 + 1
%    18  11    13 + 5       8 + 3
%    19  12    13 + 5 + 1   8 + 3 + 1
%    20  12    13 + 5 + 2   8 + 3 + 1
%    21  13    21           13
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Douglas Hofstadter,
%    Goedel, Escher, Bach,
%    Basic Books, 1979.
%
%  Parameters:
%
%    Input, integer N, the argument of the function.
%
%    Output, integer VALUE, the value of the function.
%
  if ( n <= 0 )
    value = 0;
  else
    value = n - g_hofstadter ( g_hofstadter ( n-1 ) );
  end

  return
end
