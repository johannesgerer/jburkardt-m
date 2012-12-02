function [ n_data_new, n, c ] = tau_values ( n_data )

%*****************************************************************************80
%
%% TAU_VALUES returns some values of the Tau function.
%
%  Discussion:
%
%    TAU(N) is the number of divisors of N, including 1 and N.
%
%  First values:
%
%     N   TAU(N)
%
%     1    1
%     2    2
%     3    2
%     4    3
%     5    2
%     6    4
%     7    2
%     8    4
%     9    3
%    10    4
%    11    2
%    12    6
%    13    2
%    14    4
%    15    4
%    16    5
%    17    2
%    18    6
%    19    2
%    20    6
%
%  Formula:
%
%    If the prime factorization of N is
%
%      N = P1**E1 * P2**E2 * ... * PM**EM,
%
%    then
%
%      TAU(N) = ( E1 + 1 ) * ( E2 + 1 ) * ... * ( EM + 1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%  Parameters:
%
%    Input, integer N_DATA, indicates the index of the previous test data
%    returned, or is 0 if this is the first call.  For repeated calls,
%    set the input value of N_DATA to the output value of N_DATA_NEW
%    from the previous call.
%
%    Output, integer N_DATA_NEW, the index of the test data.
%
%    Output, integer N, the argument of the Tau function.
%
%    Output, integer C, the value of the Tau function.
%
  n_max = 20;
  c_vec = [ ...
    1,  2,  2,  3,  2,  4,  2,  4,  3,  4, ...
    2, 12, 12,  4, 18, 24,  2,  8, 14, 28 ];
  n_vec = [ ...
      1,   2,   3,   4,   5,   6,   7,   8,   9,  10, ...
     23,  72, 126, 226, 300, 480, 521, 610, 832, 960 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    c = 0;
  else
    n = n_vec(n_data_new);
    c = c_vec(n_data_new);
  end

  return
end
