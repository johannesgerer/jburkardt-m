function [ n_data_new, n, c ] = sigma_values ( n_data )

%*****************************************************************************80
%
%% SIGMA_VALUES returns some values of the Sigma function.
%
%  Definition:
%
%    SIGMA(N) is the sum of the distinct divisors of N, including 1 and N.
%
%  First values:
%
%     N  SIGMA(N)
%
%     1    1
%     2    3
%     3    4
%     4    7
%     5    6
%     6   12
%     7    8
%     8   15
%     9   13
%    10   18
%    11   12
%    12   28
%    13   14
%    14   24
%    15   24
%    16   31
%    17   18
%    18   39
%    19   20
%    20   42
%
%  Formula:
%
%    SIGMA(U*V) = SIGMA(U) * SIGMA(V) if U and V are relatively prime.
%
%    SIGMA(P**K) = ( P**(K+1) - 1 ) / ( P - 1 ) if P is prime.
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
%    Output, integer N, the argument of the Sigma function.
%
%    Output, integer C, the value of the Sigma function.
%
  n_max = 20;
  c_vec = [ ...
     1,    3,    4,    7,    6,   12,    8,   15,   13,   18, ...
    72,  128,  255,  176,  576, 1170,  618,  984, 2232, 2340 ];
  n_vec = [ ...
      1,   2,   3,   4,   5,   6,   7,   8,   9,  10, ...
     30, 127, 128, 129, 210, 360, 617, 815, 816,1000 ];

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
