function [ n_data, x, cbi ] = airy_cbi_values ( n_data )

%*****************************************************************************80
%
%% AIRY_CBI_VALUES returns some values of the Airy Bi(x) with complex argument.
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
%      AiryBi[x]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2007
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
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, complex X, the argument of the function.
%
%    Output, complex CBI, the value of the Airy BI function.
%
  n_max = 10;

  cbi_vec = [ ...
    1.207423594952871  + 0.0000000000000000 * i, ...
    0.9127160108293936 + 0.3800456133135556 * i, ...
    0.6824453575635721 + 0.3343047153635002 * i, ...
    0.5726265660086474 + 0.3988641086982559 * i, ...
    0.2511841251049547 + 0.3401447690712719 * i, ...
    0.1039973894969446 + 0.0000000000000000 * i, ...
    0.2511841251049547 - 0.3401447690712719 * i, ...
    0.5726265660086474 - 0.3988641086982559 * i, ...
    0.6824453575635721 - 0.3343047153635002 * i, ...
    0.9127160108293936 - 0.3800456133135556 * i ];

  x_vec = [ ...
     1.0000000000000000 + 0.0000000000000000 * i, ...
     0.8090169943749474 + 0.5877852522924731 * i, ...
     0.3090169943749474 + 0.9510565162951536 * i, ...
    -0.3090169943749474 + 0.9510565162951536 * i, ...
    -0.8090169943749474 + 0.5877852522924731 * i, ...
    -1.0000000000000000 + 0.0000000000000000 * i, ...
    -0.8090169943749474 - 0.5877852522924731 * i, ...
    -0.3090169943749474 - 0.9510565162951536 * i, ...
     0.3090169943749474 - 0.9510565162951536 * i, ...
     0.8090169943749474 - 0.5877852522924731 * i ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    x = 0.0;
    cbi = 0.0;
  else
    x = x_vec(n_data);
    cbi = cbi_vec(n_data);
  end

  return
end
