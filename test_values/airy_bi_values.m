function [ n_data, x, bi ] = airy_bi_values ( n_data )

%*****************************************************************************80
%
%% AIRY_BI_VALUES returns some values of the Airy Bi(x) function.
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
%    Output, real BI, the value of the Airy BI function.
%
  n_max = 11;

  bi_vec = [ ...
     0.6149266274460007E+00, ... 
     0.6598616901941892E+00, ... 
     0.7054642029186612E+00, ... 
     0.7524855850873156E+00, ... 
     0.8017730000135972E+00, ... 
     0.8542770431031555E+00, ... 
     0.9110633416949405E+00, ... 
     0.9733286558781659E+00, ... 
     0.1042422171231561E+01, ... 
     0.1119872813134447E+01, ... 
     0.1207423594952871E+01 ];

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
    bi = 0.0;
  else
    x = x_vec(n_data);
    bi = bi_vec(n_data);
  end

  return
end
