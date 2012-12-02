function [ n_data, a, b, fx ] = binomial_values ( n_data )

%*****************************************************************************80
%
%% BINOMIAL_VALUES returns some values of the binomial coefficients.
%
%  Discussion:
%
%    The formula for the binomial coefficient is
%
%      C(N,K) = N! / ( K! * (N-K)! )
%
%    In Mathematica, the function can be evaluated by:
%
%      Binomial[n,k]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2004
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
%    Output, integer A, B, the arguments of the function.
%
%    Output, integer FX, the value of the function.
%
  n_max = 20;

  a_vec = [ ...
     1,  6,  6,  6, 15, ...
    15, 15, 15, 15, 15, ...
    15, 25, 25, 25, 25, ...
    25, 25, 25, 25, 25  ];

  b_vec = [ ...
     0,  1,  3,  5,  1, ...
     3,  5,  7,  9, 11, ...
    13,  1,  3,  5,  7, ...
     9, 11, 13, 15, 17 ];

  fx_vec = [ ...
           1, ...
           6, ...
          20, ...
           6, ...
          15, ...
         455, ...
        3003, ...
        6435, ...
        5005, ...
        1365, ...
         105, ...
          25, ...
        2300, ...
       53130, ...
      480700, ...
     2042975, ...
     4457400, ...
     5200300, ...
     3268760, ...
     1081575 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    a = 0;
    b = 0;
    fx = 0;
  else
    a = a_vec(n_data);
    b = b_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
