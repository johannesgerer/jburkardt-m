function [ n_data_new, x, fx ] = gud_values ( n_data )

%*****************************************************************************80
%
%% GUD_VALUES returns some values of the Gudermannian function.
%
%  Definition:
%
%    The Gudermannian function relates the hyperbolic and trigonomentric
%    functions.  For any argument X, there is a corresponding value
%    GAMMA so that
%
%      SINH(X) = TAN(GAMMA).
%
%    This value GAMMA(X) is called the Gudermannian of X and symbolized
%    GD(X).  The inverse Gudermannian function is given as input a value
%    GAMMA and computes the corresponding value X.
%
%    GD(X) = 2 * arctan ( exp ( X ) ) - PI / 2
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
%  Reference:
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
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
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 13;
  fx_vec = [ ...
    -1.301760336E+00,  -0.8657694832E+00, 0.0000000000E+00, ...
     0.09983374879E+00, 0.1986798470E+00, 0.4803810791E+00, ...
     0.8657694832E+00,  1.131728345E+00,  1.301760336E+00,  ...
     1.406993569E+00,   1.471304341E+00,  1.510419908E+00,  ...
     1.534169144E+00 ];
  x_vec = [ ...
    -2.0E+00, -1.0E+00,  0.0E+00, ...
     0.1E+00,  0.2E+00,  0.5E+00, ...
     1.0E+00,  1.5E+00,  2.0E+00, ...
     2.5E+00,  3.0E+00,  3.5E+00, ...
     4.0E+00  ];

  n_data_new = n_data;

  if ( n_data_new < 0 )
    n_data_new = 0;
  end

  n_data_new = n_data_new + 1;

  if ( n_max < n_data_new )
    n_data_new = 0;
    x = 0.0E+00;
    fx = 0.0E+00;
  else
    x = x_vec(n_data_new);
    fx = fx_vec(n_data_new);
  end

  return
end
