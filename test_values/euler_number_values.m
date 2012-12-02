function [ n_data, n, c ] = euler_number_values ( n_data )

%*****************************************************************************80
%
%% EULER_NUMBER_VALUES returns some values of the Euler numbers.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      EulerE[n]
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
%    Output, integer N, the order of the Euler number.
%
%    Output, integer C, the value of the Euler number.
%
  n_max = 8;

  c_vec = [ ...
    1, 0, -1, 5, 61, 1385, -50521, 2702765 ];

  n_vec = [ ...
     0, 1, 2, 4, 6, 8, 10, 12 ];

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
