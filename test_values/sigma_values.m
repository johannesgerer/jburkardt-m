function [ n_data, n, c ] = sigma_values ( n_data )

%*****************************************************************************80
%
%% SIGMA_VALUES returns some values of the Sigma function.
%
%  Discussion:
%
%    SIGMA(N) is the sum of the distinct divisors of N, including 1 and N.
%
%    In Mathematica, the function can be evaluated by:
%
%      DivisorSigma[1,n]
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
%    19 September 2004
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
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
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
      1,   2,   3,   4,   5,   6,   7,   8,   9,   10, ...
     30, 127, 128, 129, 210, 360, 617, 815, 816, 1000 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    c = 0;
  else
    n = n_vec(n_data);
    c = c_vec(n_data);
  end

  return
end
