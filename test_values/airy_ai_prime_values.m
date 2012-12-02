function [ n_data, x, aip ] = airy_ai_prime_values ( n_data )

%*****************************************************************************80
%
%% AIRY_AI_PRIME_VALUES returns some values of the Airy function Ai'(x).
%
%  Discussion:
%
%    The Airy functions Ai(X) and Bi(X) are a pair of linearly independent
%    solutions of the differential equation:
%
%      W'' - X * W = 0
%
%    In Mathematica, the function can be evaluated by:
%
%      AiryAiPrime[x]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2004
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
%    Output, real X, the argument of the function.
%
%    Output, real AIP, the derivative of the Airy AI function.
%
  n_max = 11;

  aip_vec = [ ...
     -0.2588194037928068E+00, ...
     -0.2571304219075862E+00, ...
     -0.2524054702856195E+00, ...
     -0.2451463642190548E+00, ...
     -0.2358320344192082E+00, ...
     -0.2249105326646839E+00, ...
     -0.2127932593891585E+00, ...
     -0.1998511915822805E+00, ...
     -0.1864128638072717E+00, ...
     -0.1727638434616347E+00, ...
     -0.1591474412967932E+00 ];

  x_vec = [ ...
     0.0E+00, ...
     0.1E+00, ...
     0.2E+00, ...
     0.3E+00, ...
     0.4E+00, ...
     0.5E+00, ...
     0.6E+00, ...
     0.7E+00, ...
     0.8E+00, ...
     0.9E+00, ...
     1.0E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    x = 0.0;
    aip = 0.0;
  else
    x = x_vec(n_data);
    aip = aip_vec(n_data);
  end

  return
end
