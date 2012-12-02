function [ n_data_new, n, c ] = omega_values ( n_data )

%*****************************************************************************80
%
%% OMEGA_VALUES returns some values of the OMEGA function.
%
%  First values:
%
%     N   OMEGA(N)
%
%     1    1
%     2    1
%     3    1
%     4    1
%     5    1
%     6    2
%     7    1
%     8    1
%     9    1
%    10    2
%    11    1
%    12    2
%    13    1
%    14    2
%    15    2
%    16    1
%    17    1
%    18    2
%    19    1
%    20    2
%
%  Formula:
%
%    If N = 1, then
%
%      OMEGA(N) = 1
%
%    else if the prime factorization of N is
%
%      N = P1**E1 * P2**E2 * ... * PM**EM,
%
%    then
%
%      OMEGA(N) = M
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
%    Output, integer N, the argument of the OMEGA function.
%
%    Output, integer C, the value of the OMEGA function.
%
  n_max = 23;
  c_vec = [ ...
      1,   1,   1,   1,   1, ...
      2,   1,   1,   1,   2, ...
      3,   1,   4,   4,   3, ...
      1,   5,   2,   2,   1, ...
      6,   7,   8 ];
  n_vec = [ ...
           1,        2,        3,        4,        5, ...
           6,        7,        8,        9,       10, ...
          30,      101,      210,     1320,     1764, ...
        2003,     2310,     2827,     8717,    12553, ...
       30030,   510510,  9699690 ];

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
