function [ n_data_new, n, x, fx ] = legendre_function_q_values ( n_data )

%*****************************************************************************80
%
%% LEGENDRE_FUNCTION_Q_VALUES returns values of the Legendre Q function.
%
%  Differential equation:
%
%    (1-X*X) Y'' - 2 X Y' + N (N+1) = 0
%
%  First terms:
%
%    Q(0)(X) = 0.5 * log((1+X)/(1-X))
%    Q(1)(X) = Q(0)(X)*X - 1
%    Q(2)(X) = Q(0)(X)*(3*X*X-1)/4 - 1.5*X
%    Q(3)(X) = Q(0)(X)*(5*X*X*X-3*X)/4 - 2.5*X**2 + 2/3
%    Q(4)(X) = Q(0)(X)*(35*X**4-30*X**2+3)/16 - 35/8 * X**3 + 55/24 * X
%    Q(5)(X) = Q(0)(X)*(63*X**5-70*X**3+15*X)/16 - 63/8*X**4 + 49/8*X**2 - 8/15
%
%  Recursion:
%
%    Q(0) = 0.5 * log ( (1+X) / (1-X) )
%    Q(1) = 0.5 * X * log ( (1+X) / (1-X) ) - 1.0
%
%    Q(N) = ( (2*N-1) * X * Q(N-1) - (N-1) * Q(N-2) ) / N
%
%  Restrictions:
%
%    -1 < X < 1
%
%  Special values:
%
%    Note that the Legendre function Q(N)(X) is equal to the
%    associated Legendre function of the second kind,
%    Q(N,M)(X) with M = 0.
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
%    Output, integer N, the order of the function.
%
%    Output, real X, the point where the function is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 12;
  fx_vec = [ ...
     0.00000000E+00, -1.00000000E+00,  0.00000000E+00, ...
     0.66666667E+00, -0.40634921E+00,  0.00000000E+00, ...
     0.54930614E+00, -0.72534693E+00, -0.81866327E+00, ...
    -0.19865477E+00, -0.11616303E+00,  0.29165814E+00 ];
  n_vec = [ ...
     0,  1,  2, ...
     3,  9, 10, ...
     0,  1,  2, ...
     3,  9, 10 ];
  x_vec = [ ...
    0.0E+00,  0.0E+00,  0.0E+00, ...
    0.0E+00,  0.0E+00,  0.0E+00, ...
    0.5E+00,  0.5E+00,  0.5E+00, ...
    0.5E+00,  0.5E+00,  0.5E+00  ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    n = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    n = n_vec(n_data_new);
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
