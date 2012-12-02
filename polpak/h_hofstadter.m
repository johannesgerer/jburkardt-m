function value = h_hofstadter ( n )

%*****************************************************************************80
%
%% H_HOFSTADTER computes the Hofstadter H sequence.
%
%  Discussion:
%
%    H(N) = 0                          if N = 0
%         = N - H ( H ( H ( N - 1 ) ), otherwise.
%
%    H(N) is defined for all nonnegative integers.
%
%  Table:
%
%     N  H(N)
%    --  ----
%
%     0     0
%     1     1
%     2     1
%     3     2
%     4     3
%     5     4
%     6     4
%     7     5
%     8     5
%     9     6
%    10     7
%    11     7
%    12     8
%    13     9
%    14    10
%    15    10
%    16    11
%    17    12
%    18    13
%    19    13
%    20    14
%    21    14
%    22    15
%    23    16
%    24    17
%    25    17
%    26    18
%    27    18
%    28    19
%    29    20
%    30    20
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
    value = n - h_hofstadter ( h_hofstadter ( h_hofstadter ( n-1 ) ) );
  end

  return
end
