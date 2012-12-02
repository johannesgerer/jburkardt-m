function count = collatz_count ( n )

%*****************************************************************************80
%
%% COLLATZ_COUNT counts the number of terms in a Collatz sequence.
%
%  Discussion:
%
%    The rules for generation of the Collatz sequence are recursive.
%    If T is the current entry of the sequence, (T is
%    assumed to be a positive integer), then the next
%    entry, U is determined as follows:
%
%      if T is 1 (or less)
%        terminate the sequence;
%      else if T is even
%        U = T/2.
%      else (if T is odd and not 1)
%        U = 3*T+1;
%
%     N  Sequence                                                Length
%
%     1                                                               1
%     2   1                                                           2
%     3  10,  5, 16,  8,  4,  2,  1                                   8
%     4   2   1                                                       3
%     5  16,  8,  4,  2,  1                                           6
%     6   3, 10,  5, 16,  8,  4,  2,  1                               9
%     7  22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1   17
%     8   4,  2,  1                                                   4
%     9  28, 14,  7, ...                                             20
%    10   5, 16,  8,  4,  2,  1                                       7
%    11  34, 17, 52, 26, 13, 40, 20, 10,  5, 16, 8, 4, 2, 1          15
%    12   6,  3, 10,  5, 16,  8,  4,  2,  1                          10
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Weisstein,
%    "The Collatz Problem",
%    CRC Concise Encyclopedia of Mathematics,
%    CRC 1998.
%
%  Parameters:
%
%    Input, integer N, the first element of the sequence.
%
%    Output, integer COUNT, the number of elements in
%    the Collatz sequence that begins with N.
%
  count = 1;

  n = round ( n );

  while ( 1 )

    if ( n <= 1 )
      break
    elseif ( mod ( n, 2 ) == 0 )
      n = n / 2;
    else
      n = 3 * n + 1;
    end

    count = count + 1;

  end

  return
end
