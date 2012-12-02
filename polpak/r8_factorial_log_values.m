function [ n_data_new, n, fn ] = r8_factorial_log_values ( n_data )

%*****************************************************************************80
%
%% R8_FACTORIAL_LOG_VALUES returns values of log(n!).
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
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
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
  n_max = 27;
  fn_vec = [ ...
      0.0E+00,         0.0E+00,       0.6931472E+00,  1.791757E+00, ...
      3.178051E+00,    4.787489E+00,  6.579246E+00,   8.525160E+00, ...
     10.60460E+00,    12.80182E+00,  15.10441E+00,   17.50232E+00, ...
     19.98722E+00,    22.55216E+00,  25.19123E+00,   27.89927E+00, ...
     30.67186E+00,    33.50508E+00,  36.39544E+00,   39.33987E+00, ...
     42.33561E+00,    58.00362E+00, 148.4778E+00,   363.7394E+00, ...
    605.0201E+00,   2611.331E+00,   5912.128E+00 ];
  n_vec = [ ...
     0,   1,    2,   3, ...
     4,   5,    6,   7, ...
     8,   9,   10,  11, ...
    12,  13,   14,  15, ...
    16,  17,   18,  19, ...
    20,  25,   50, 100, ...
   150, 500, 1000 ];

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
