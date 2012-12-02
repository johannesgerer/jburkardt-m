function [ n_data, n, fn ] = i4_factorial2_values ( n_data )

%*****************************************************************************80
%
%% I4_FACTORIAL2_VALUES returns values of the double factorial function.
%
%  Formula:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%  Example:
%
%     N    N%%
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
%    14 August 2004
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
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, page 516.
%
%  Parameters:
%
%    Input, integer N_DATA, indicates the index of the previous test data
%    returned, or is 0 if this is the first call.  For repeated calls,
%    set the input value of N_DATA to the output value of N_DATA
%    from the previous call.
%
%    Output, integer N_DATA, the index of the test data.
%
%    Output, integer N, the argument of the function.
%
%    Output, integer FN, the value of the function.
%
  n_max = 16;
  fn_vec = [ ...
        1, ...
        1,     2,      3,      8,      15, ...
       48,   105,    384,    945,    3840, ...
    10395, 46080, 135135, 645120, 2027025 ];
  n_vec = [ ...
     0, ...
     1,  2,  3,  4,  5, ...
     6,  7,  8,  9, 10, ...
    11, 12, 13, 14, 15 ];

  if ( n_data < 0 )
    n_data_new = 0;
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
