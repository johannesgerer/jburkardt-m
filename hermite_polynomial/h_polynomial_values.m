function [ n_data, n, x, fx ] = h_polynomial_values ( n_data )

%*****************************************************************************80
%
%% H_POLYNOMIAL_VALUES: values of the physicist's Hermite polynomial H(n,x).
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      HermiteH[n,x]
%
%  Differential equation:
%
%    Y'' - 2 X Y' + 2 N Y = 0
%
%  First terms:
%
%      1
%      2 X
%      4 X^2     -  2
%      8 X^3     - 12 X
%     16 X^4     - 48 X^2     + 12
%     32 X^5    - 160 X^3    + 120 X
%     64 X^6    - 480 X^4    + 720 X^2    - 120
%    128 X^7   - 1344 X^5   + 3360 X^3   - 1680 X
%    256 X^8   - 3584 X^6  + 13440 X^4  - 13440 X^2   + 1680
%    512 X^9   - 9216 X^7  + 48384 X^5  - 80640 X^3  + 30240 X
%   1024 X^10 - 23040 X^8 + 161280 X^6 - 403200 X^4 + 302400 X^2 - 30240
%
%  Recursion:
%
%    H(0,X) = 1,
%    H(1,X) = 2*X,
%    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
%
%  Norm:
%
%    Integral ( -oo < X < +oo ) exp ( - X^2 ) * H(N,X)^2 dX
%    = sqrt ( PI ) * 2^N * N!
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
%    Output, integer N, the order of the polynomial.
%
%    Output, real X, the point where the polynomial is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 18;

  fx_vec = [ ...
      0.1000000000000000E+01, ...
      0.1000000000000000E+02, ...
      0.9800000000000000E+02, ... 
      0.9400000000000000E+03, ...
      0.8812000000000000E+04, ...
      0.8060000000000000E+05, ...
      0.7178800000000000E+06, ...
      0.6211600000000000E+07, ...
      0.5206568000000000E+08, ...
      0.4212712000000000E+09, ...
      0.3275529760000000E+10, ...
      0.2432987360000000E+11, ...
      0.1712370812800000E+12, ...
      0.0000000000000000E+00, ...
      0.4100000000000000E+02, ...
     -0.8000000000000000E+01, ...
      0.3816000000000000E+04, ...
      0.3041200000000000E+07 ];

  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12,  5,  5, ...
     5,  5,  5 ];

  x_vec = [ ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     5.0E+00, ...
     0.0E+00, ...
     0.5E+00, ...
     1.0E+00, ...
     3.0E+00, ...
     1.0E+01 ];

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
