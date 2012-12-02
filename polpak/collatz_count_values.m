function [ n_data, n, count ] = collatz_count_values ( n_data )

%*****************************************************************************80
%
%% COLLATZ_COUNT_VALUES returns some values of the Collatz count function.
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
%    The Collatz count is the length of the Collatz sequence for a given
%    starting value.  By convention, we include the initial value in the
%    count, so the minimum value of the count is 1.
%
%     N  Sequence                                                 Count
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
%    07 March 2006
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
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the initial value of a Collatz sequence.
%
%    Output, integer COUNT, the length of the Collatz sequence starting
%    with N.
%
  n_max = 20;

  count_vec = [ ...
      1,   2,   8,   3,   6,   9,   17,   4,  20,   7, ...
    112,  25,  26,  27,  17,  28,  111,  18,  83,  29 ];
  n_vec = [ ...
      1,   2,   3,   4,   5,   6,   7,   8,   9,  10, ...
     27,  50, 100, 200, 300, 400, 500, 600, 700, 800 ];

  if ( n_data < 0 ) 
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    count = 0;
  else
    n = n_vec(n_data);
    count = count_vec(n_data);
  end

  return
end
