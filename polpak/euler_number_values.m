function [ n_data_new, n, c ] = euler_number_values ( n_data )

%*****************************************************************************80
%
%% EULER_NUMBER_VALUES returns some values of the Euler numbers.
%
%  Discussion:
%
%    These numbers rapidly get too big to store in an ordinary integer!
%
%    The terms of odd index are 0.
%
%    E(N) = -C(N,N-2) * E(N-2) - C(N,N-4) * E(N-4) - ... - C(N,0) * E(0).
%
%  First terms:
%
%    E0  = 1
%    E1  = 0
%    E2  = -1
%    E3  = 0
%    E4  = 5
%    E5  = 0
%    E6  = -61
%    E7  = 0
%    E8  = 1385
%    E9  = 0
%    E10 = -50521
%    E11 = 0
%    E12 = 2702765
%    E13 = 0
%    E14 = -199360981
%    E15 = 0
%    E16 = 19391512145
%    E17 = 0
%    E18 = -2404879675441
%    E19 = 0
%    E20 = 370371188237525
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2015
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
%    Output, integer N, the order of the Euler number.
%
%    Output, integer C, the value of the Euler number.
%
  n_max = 8;
  c_vec = [ ...
    1, 0, -1, 5, -61, 1385, -50521, 2702765 ];
  n_vec = [ ...
     0, 1, 2, 4, 6, 8, 10, 12 ];

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
