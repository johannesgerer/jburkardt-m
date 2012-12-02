function [ n_data, x, bip ] = airy_bi_prime_values ( n_data )

%*****************************************************************************80
%
%% AIRY_BI_PRIME_VALUES returns some values of the Airy function Bi'(x).
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
%      AiryBiPrime[x]
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
%    Output, real BIP, the derivative of the Airy BI function.
%
  n_max = 11;

  bip_vec = [ ...
     0.4482883573538264E+00, ... 
     0.4515126311496465E+00, ... 
     0.4617892843621509E+00, ... 
     0.4800490287524480E+00, ... 
     0.5072816760506224E+00, ... 
     0.5445725641405923E+00, ... 
     0.5931444786342857E+00, ... 
     0.6544059191721400E+00, ... 
     0.7300069016152518E+00, ... 
     0.8219038903072090E+00, ... 
     0.9324359333927756E+00 ];

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
    bip = 0.0;
  else
    x = x_vec(n_data);
    bip = bip_vec(n_data);
  end

  return
end
