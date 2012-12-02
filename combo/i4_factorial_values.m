function [ n_data, n, fn ] = i4_factorial_values ( n_data )

%*****************************************************************************80
%
%% I4_FACTORIAL_VALUES returns values of the factorial function.
%
%  Discussion:
%
%    0! = 1
%    I! = Product ( 1 <= J <= I ) I
%
%    In Mathematica, the function can be evaluated by:
%
%      n!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
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
%    Output, integer N, the argument of the function.
%
%    Output, integer FN, the value of the function.
%
  n_max = 13;

  fn_vec = [ ...
            1, ...
            1, ...
            2, ...
            6, ...
           24, ...
          120, ...
          720, ...
         5040, ...
        40320, ...
       362880, ...
      3628800, ...
     39916800, ...
    479001600 ];

  n_vec = [ ...
     0,  1,  2,  3, ...
     4,  5,  6,  7, ...
     8,  9, 10, 11, ...
    12 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    fn = 0;
  else
    n = n_vec(n_data);
    fn = fn_vec(n_data);
  end

  return
end
