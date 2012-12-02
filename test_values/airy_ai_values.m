function [ n_data, x, ai ] = airy_ai_values ( n_data )

%*****************************************************************************80
%
%% AIRY_AI_VALUES returns some values of the Airy Ai(x) function.
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
%      AiryAi[x]
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
%    Output, real AI, the value of the Airy AI function.
%
  n_max = 11;

  ai_vec = [ ...
     0.3550280538878172E+00, ...
     0.3292031299435381E+00, ...
     0.3037031542863820E+00, ...
     0.2788064819550049E+00, ...
     0.2547423542956763E+00, ...
     0.2316936064808335E+00, ...
     0.2098000616663795E+00, ...
     0.1891624003981501E+00, ...
     0.1698463174443649E+00, ...
     0.1518868036405444E+00, ...
     0.1352924163128814E+00 ];

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
    ai = 0.0;
  else
    x = x_vec(n_data);
    ai = ai_vec(n_data);
  end

  return
end
