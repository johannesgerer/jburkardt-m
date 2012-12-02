function [ n_data_new, a, b, x, fx ] = beta_inc_values ( n_data )

%*****************************************************************************80
%
%% BETA_INC_VALUES returns some values of the incomplete Beta function.
%
%  Discussion:
%
%    The incomplete Beta function may be written
%
%      BETA_INC(A,B,X) = Integral (0 to X) T**(A-1) * (1-T)**(B-1) dT
%                      / Integral (0 to 1) T**(A-1) * (1-T)**(B-1) dT
%
%    Thus,
%
%      BETA_INC(A,B,0.0) = 0.0
%      BETA_INC(A,B,1.0) = 1.0
%
%    Note that in Mathematica, the expressions:
%
%      BETA[A,B]   = Integral (0 to 1) T**(A-1) * (1-T)**(B-1) dT
%      BETA[X,A,B] = Integral (0 to X) T**(A-1) * (1-T)**(B-1) dT
%
%    and thus, to evaluate the incomplete Beta function requires:
%
%      BETA_INC(A,B,X) = BETA[X,A,B] / BETA[A,B]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2004
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
%    Karl Pearson,
%    Tables of the Incomplete Beta Function,
%    Cambridge University Press, 1968.
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
%    Output, real A, B, X, the arguments of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 30;
  a_vec = [ ...
     0.5E+00,  0.5E+00,  0.5E+00,  1.0E+00, ...
     1.0E+00,  1.0E+00,  1.0E+00,  1.0E+00, ...
     2.0E+00,  2.0E+00,  2.0E+00,  2.0E+00, ...
     2.0E+00,  2.0E+00,  2.0E+00,  2.0E+00, ...
     2.0E+00,  5.5E+00, 10.0E+00, 10.0E+00, ...
    10.0E+00, 10.0E+00, 20.0E+00, 20.0E+00, ...
    20.0E+00, 20.0E+00, 20.0E+00, 30.0E+00, ...
    30.0E+00, 40.0E+00 ];
  b_vec = [ ...
     0.5E+00,  0.5E+00,  0.5E+00,  0.5E+00, ...
     0.5E+00,  0.5E+00,  0.5E+00,  1.0E+00, ...
     2.0E+00,  2.0E+00,  2.0E+00,  2.0E+00, ...
     2.0E+00,  2.0E+00,  2.0E+00,  2.0E+00, ...
     2.0E+00,  5.0E+00,  0.5E+00,  5.0E+00, ...
     5.0E+00, 10.0E+00,  5.0E+00, 10.0E+00, ...
    10.0E+00, 20.0E+00, 20.0E+00, 10.0E+00, ...
    10.0E+00, 20.0E+00 ];
  fx_vec = [ ...
    0.0637686E+00, 0.2048328E+00, 1.0000000E+00, 0.0E+00,       ...
    0.0050126E+00, 0.0513167E+00, 0.2928932E+00, 0.5000000E+00, ...
    0.028E+00,     0.104E+00,     0.216E+00,     0.352E+00,     ...
    0.500E+00,     0.648E+00,     0.784E+00,     0.896E+00,     ...
    0.972E+00,     0.4361909E+00, 0.1516409E+00, 0.0897827E+00, ...
    1.0000000E+00, 0.5000000E+00, 0.4598773E+00, 0.2146816E+00, ...
    0.9507365E+00, 0.5000000E+00, 0.8979414E+00, 0.2241297E+00, ...
    0.7586405E+00, 0.7001783E+00 ];
  x_vec = [ ...
    0.01E+00, 0.10E+00, 1.00E+00, 0.0E+00,  ...
    0.01E+00, 0.10E+00, 0.50E+00, 0.50E+00, ...
    0.1E+00,  0.2E+00,  0.3E+00,  0.4E+00,  ...
    0.5E+00,  0.6E+00,  0.7E+00,  0.8E+00,  ...
    0.9E+00,  0.50E+00, 0.90E+00, 0.50E+00, ...
    1.00E+00, 0.50E+00, 0.80E+00, 0.60E+00, ...
    0.80E+00, 0.50E+00, 0.60E+00, 0.70E+00, ...
    0.80E+00, 0.70E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    a = 0.0E+00;
    b = 0.0E+00;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    a = a_vec(n_data_new);
    b = b_vec(n_data_new);
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
