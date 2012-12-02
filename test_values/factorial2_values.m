function [ n_data, n, fn ] = factorial2_values ( n_data )

%*****************************************************************************80
%
%% FACTORIAL2_VALUES returns values of the double factorial function.
%
%  Formula:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%    In Mathematica, the function can be evaluated by:
%
%      n!!
%
%  Example:
%
%     N    N!!
%
%     0     1
%     1     1
%     2     2
%     3     3
%     4     8
%     5    15
%     6    48
%     7   105
%     8   384
%     9   945
%    10  3840
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
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, page 16.
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
  n_max = 16;

  fn_vec = [ ...
          1, ...
          1, ...
          2, ...
          3, ...
          8, ...
         15, ...
         48, ...
        105, ...
        384, ...
        945, ...
       3840, ...
      10395, ...
      46080, ...
     135135, ...
     645120, ...
    2027025 ];

  n_vec = [ ...
     0, ...
     1,  2,  3,  4,  5, ...
     6,  7,  8,  9, 10, ...
    11, 12, 13, 14, 15 ];

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
