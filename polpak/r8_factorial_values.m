function [ n_data_new, n, fn ] = r8_factorial_values ( n_data )

%*****************************************************************************80
%
%% R8_FACTORIAL_VALUES returns values of the real factorial function.
%
%  Definition:
%
%    0! = 1
%    I! = Product ( 1 <= J <= I ) J
%
%  Discussion:
%
%    Although the factorial is an integer valued function, it quickly
%    becomes too large for an integer to hold.  This routine still accepts
%    an integer as the input argument, but returns the function value
%    as a real number.
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
%    Output, integer N, the argument of the function.
%
%    Output, real FN, the value of the function.
%
  n_max = 23;
  fn_vec = [ ...
    1.0E+00, 1.0E+00, 2.0E+00, 6.0E+00, ...
    24.0E+00, 120.0E+00, 720.0E+00, 5040.0E+00, ...
    40320.0E+00, 362880.0E+00, 3628800.0E+00, 39916800.0E+00, ...
    479001600.0E+00, 6227020800.0E+00, 87178291200.0E+00, 1307674368000.0E+00, ...
    2.0922789888E+13, 3.5568742810E+14, 6.4023737057E+15, 1.2164510041E+17, ...
    2.4329020082E+18, 1.5511210043E+25, 2.6525285981E+32 ];
  n_vec = [ ...
     0,  1,  2,  3, ...
     4,  5,  6,  7, ...
     8,  9, 10, 11, ...
    12, 13, 14, 15, ...
    16, 17, 18, 19, ...
    20, 25, 30 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    fn = 0.0E+00;
  else
    n = n_vec(n_data_new);
    fn = fn_vec(n_data_new);
  end

  return
end
