function [ n_data_new, n, k, x, b ] = bernstein_poly_values ( n_data )

%*****************************************************************************80
%
%% BERNSTEIN_POLY_VALUES returns some values of the Bernstein polynomials.
%
%  Discussion:
%
%    The Bernstein polynomials are assumed to be based on [0,1].
%
%  Formula:
%
%    B(N,I)(X) = [N!/(I!*(N-I)!)] * (1-X)**(N-I) * X**I
%
%  First values:
%
%    B(0,0)(X) = 1
%
%    B(1,0)(X) =      1-X
%    B(1,1)(X) =                X
%
%    B(2,0)(X) =     (1-X)**2
%    B(2,1)(X) = 2 * (1-X)    * X
%    B(2,2)(X) =                X**2
%
%    B(3,0)(X) =     (1-X)**3
%    B(3,1)(X) = 3 * (1-X)**2 * X
%    B(3,2)(X) = 3 * (1-X)    * X**2
%    B(3,3)(X) =                X**3
%
%    B(4,0)(X) =     (1-X)**4
%    B(4,1)(X) = 4 * (1-X)**3 * X
%    B(4,2)(X) = 6 * (1-X)**2 * X**2
%    B(4,3)(X) = 4 * (1-X)    * X**3
%    B(4,4)(X) =                X**4
%
%  Special values:
%
%    B(N,I)(X) has a unique maximum value at X = I/N.
%
%    B(N,I)(X) has an I-fold zero at 0 and and N-I fold zero at 1.
%
%    B(N,I)(1/2) = C(N,K) / 2**N
%
%    For a fixed X and N, the polynomials add up to 1:
%
%      Sum ( 0 <= I <= N ) B(N,I)(X) = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2004
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
%    Output, integer N, the degree of the polynomial.
%
%    Output, integer K, the index of the polynomial.
%
%    Output, real X, the argument of the polynomial.
%
%    Output, real B, the value of the polynomial B(N,K)(X).
%
  n_max = 15;
  b_vec = [ ...
    1.0E+00, ...
    0.75E+00,       0.25E+00, ...
    0.5625E+00,     0.3750E+00,   0.0625E+00, ...
    0.421875E+00,   0.421875E+00, 0.140625E+00,  0.015625E+00, ...
    0.31640625E+00, 0.421875E+00, 0.2109375E+00, 0.046875E+00, 0.00390625E+00 ];
  k_vec = [ ...
    0, ...
    0, 1, ...
    0, 1, 2, ...
    0, 1, 2, 3, ...
    0, 1, 2, 3, 4 ];
  n_vec = [ ...
    0, ...
    1, 1, ...
    2, 2, 2, ...
    3, 3, 3, 3, ...
    4, 4, 4, 4, 4 ];
  x_vec = [ ...
    0.25E+00, ...
    0.25E+00, 0.25E+00, ...
    0.25E+00, 0.25E+00, 0.25E+00, ...
    0.25E+00, 0.25E+00, 0.25E+00, 0.25E+00, ...
    0.25E+00, 0.25E+00, 0.25E+00, 0.25E+00, 0.25E+00 ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    k = 0;
    x = 0.0E+00;
    b = 0.0E+00;
  else
    n = n_vec(n_data_new);
    k = k_vec(n_data_new);
    x = x_vec(n_data_new);
    b = b_vec(n_data_new);
  end

  return
end
