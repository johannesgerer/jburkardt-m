function [ n_data, n, x, fx ] = hf_function_values ( n_data )

%*****************************************************************************80
%
%% HF_FUNCTION_VALUES: tabulated values of Hf(i,x).
%
%  Discussion:
%
%    Hf(I,X) represents the Hermite function of "degree" I.  
%
%    In Mathematica, the function can be evaluated by:
%
%      Hf(n,x) = HermiteH[n,x] 
%        * Exp [ -1/2 * x^2] / Sqrt [ 2^n * n! * Sqrt[Pi] ]
%
%    The Hermite functions are orthonormal:
%
%      Integral ( -oo < x < +oo ) Hf(m,x) Hf(n,x) dx = delta ( m, n )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Cambridge University Press, 1999,
%    ISBN: 0-521-64314-7,
%    LC: QA76.95.W65.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0
%    before the first call.  On each call, the routine increments N_DATA by 1,
%    and returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the order of the polynomial.
%
%    Output, real X, the point where the polynomial is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 23;

  fx_vec = [ ...
    0.7511255444649425E+00,  0.0000000000000000E+00, -0.5311259660135985E+00, ...
    0.0000000000000000E+00,  0.4599685791773266E+00,  0.0000000000000000E+00, ...
    0.4555806720113325E+00,  0.6442883651134752E+00,  0.3221441825567376E+00, ...
   -0.2630296236233334E+00, -0.4649750762925110E+00, -0.5881521185179581E-01, ...
    0.3905052515434106E+00,  0.2631861423064045E+00, -0.2336911435996523E+00, ...
   -0.3582973361472840E+00,  0.6146344487883041E-01,  0.3678312067984882E+00, ...
    0.9131969309166278E-01,  0.4385750950032321E+00, -0.2624689527931006E-01, ...
    0.5138426125477819E+00,  0.09355563118061758E+00 ];

  n_vec = [ ...
    0,  1,  2,  ...
    3,  4,  5,  ...
    0,  1,  2,  ...
    3,  4,  5,  ...
    6,  7,  8,  ...
    9, 10, 11,  ...
   12,  5,  5,  ...
    5,  5  ];

  x_vec = [ ...
    0.0E+00, 0.0E+00, 0.0E+00, ...
    0.0E+00, 0.0E+00, 0.0E+00, ...
    1.0E+00, 1.0E+00, 1.0E+00, ...
    1.0E+00, 1.0E+00, 1.0E+00, ...
    1.0E+00, 1.0E+00, 1.0E+00, ...
    1.0E+00, 1.0E+00, 1.0E+00, ...
    1.0E+00, 0.5E+00, 2.0E+00, ...
    3.0E+00, 4.0E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    x = 0.0;
    fx = 0.0;
  else
    n = n_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
