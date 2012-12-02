function [ n_data_new, n, c ] = phi_values ( n_data )

%*****************************************************************************80
%
%% PHI_VALUES returns some values of the PHI function.
%
%  Definition:
%
%    PHI(N) is the number of integers between 1 and N which are
%    relatively prime to N.  I and J are relatively prime if they
%    have no common factors.  The function PHI(N) is known as
%    "Euler's totient function".
%
%    By convention, 1 and N are relatively prime.
%
%  First values:
%
%     N  PHI(N)
%
%     1    1
%     2    1
%     3    2
%     4    2
%     5    4
%     6    2
%     7    6
%     8    4
%     9    6
%    10    4
%    11   10
%    12    4
%    13   12
%    14    6
%    15    8
%    16    8
%    17   16
%    18    6
%    19   18
%    20    8
%
%  Formula:
%
%    PHI(U*V) = PHI(U) * PHI(V) if U and V are relatively prime.
%
%    PHI(P**K) = P**(K-1) * ( P - 1 ) if P is prime.
%
%    PHI(N) = N * Product ( P divides N ) ( 1 - 1 / P )
%
%    N = Sum ( D divides N ) PHI(D).
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
%    Output, integer N, the argument of the PHI function.
%
%    Output, integer C, the value of the PHI function.
%
  n_max = 20;
  c_vec = [ ...
      1,   1,   2,   2,   4,   2,   6,   4,   6,   4, ...
      8,   8,  16,  20,  16,  40, 148, 200, 200, 648 ];
  n_vec = [ ...
      1,   2,   3,   4,   5,   6,   7,   8,   9,  10, ...
     20,  30,  40,  50,  60, 100, 149, 500, 750, 999 ];

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
