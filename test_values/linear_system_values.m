function [ n_data_new, nrow, ncol, nsys, a, x, b ] = linear_system_values ( n_data )

%*****************************************************************************80
%
%% LINEAR_SYSTEM_VALUES returns some linear systems.
%
%  Discussion:
%
%    Each call to this routine returns scalars NROW, NCOL and NSYS,
%    which give the dimensions of the linear system
%
%      A(NROW,NCOL) * X(NCOL,NSYS) = B(NROW,NSYS)
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
%  Parameters:
%
%    Input, integer N_DATA, indicates the index of the previous test data
%    returned, or is 0 if this is the first call.  For repeated calls,
%    set the input value of N_DATA to the output value of N_DATA_NEW
%    from the previous call.
%
%    Output, integer N_DATA_NEW, the index of the test data.
%
%    Output, integer NROW, NCOL, the number of rows and columns of A.
%
%    Output, integer NSYS, the number of systems.
%
%    Output, real A(NROW,NCOL), the matrix.
%
%    Output, real X(NCOL,NSYS), the solutions of the linear system.
%
%    Output, real B(NROW,NSYS), the right hand sides.
%
  n_max = 4;

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )

    n_data_new = 0;
    nrow = 0;
    ncol = 0;
    nsys = 0;

  elseif ( n_data_new == 1 )

    nrow = 3;
    ncol = 3;
    nsys = 2;

    a[ ...
      1.0, 0.0, 0.0;
      0.0, 2.0, 0.0;
      0.0, 0.0, 3.0 ];
    x = [ ...
      1.0, 1.0; ...
      0.0, 1.0; ...
      0.0, 1.0 ];
    b = [ ...
      1.0, 1.0; ...
      0.0, 2.0; ...
      0.0, 3.0 ];

  elseif ( n_data_new == 2 )

    nrow = 3;
    ncol = 3;
    nsys = 2;

    a = [ ...
      1.0, 2.0, 3.0, ...
      2.0, 2.0, 3.0, ...
      3.0, 3.0, 3.0 ];
    x = [ ...
      1.0, 1.0; ...
      1.0, 2.0; ...
      1.0, 3.0 ];
    b = [ ...
      6.0, 14.0;
      7.0, 15.0;
      9.0, 18.0 ];

  elseif ( n_data_new == 3 )

    nrow = 5;
    ncol = 5;
    nsys = 2;

    a = [ ...
      1.0, 2.0, 3.0, 4.0, 5.0, ...
      2.0, 3.0, 4.0, 5.0, 1.0, ...
      3.0, 4.0, 5.0, 1.0, 2.0, ...
      4.0, 5.0, 1.0, 2.0, 3.0, ...
      5.0, 1.0, 2.0, 3.0, 4.0 ];
    x = [ ...
      0.066667, 1.0; ...
      0.066667, 0.0; ...
      0.066667, 0.0; ...
      0.066667, 0.0; ...
      0.066667, 0.0 ];
    b = [ ...
      1.0, 1.0; ...
      1.0, 2.0; ...
      1.0, 3.0; ...
      1.0, 4.0; ...
      1.0, 5.0 ];

  elseif ( n_data_new == 4 )

    nrow = 5;
    ncol = 5;
    nsys = 2;

    a = [ ...
      1.4, 2.1, 2.1, 7.4, 9.6; ...
      1.6, 1.5, 1.1, 0.7, 5.0; ...
      3.8, 8.0, 9.6, 5.4, 8.8; ...
      4.6, 8.2, 8.4, 0.4, 8.0; ...
      2.6, 2.9, 0.1, 9.6, 7.7 ];

    x = [ ...
      -5.313077,  31.601006; ...
       5.735670, -28.594793; ...
      -2.507606,  13.389395; ...
      -1.058741,   2.780322; ...
       0.999381,  -3.008797 ];
    b = [ ...
      1.1, 4.0; ...
      1.6, 9.3; ...
      4.7, 8.4; ...
      9.1, 0.4; ...
      0.1, 4.1 ];

  end

  return
end
