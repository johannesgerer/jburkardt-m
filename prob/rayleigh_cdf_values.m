function [ n_data, sigma, x, fx ] = rayleigh_cdf_values ( n_data )

%*****************************************************************************80
%
%% RAYLEIGH_CDF_VALUES returns some values of the Rayleigh CDF.
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      Needs["Statistics`ContinuousDistributions`"]
%      dist = RayleighDistribution [ sigma ]
%      CDF [ dist, x ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
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
%    Output, real SIGMA, the shape parameter of the distribution.
%
%    Output, real X, the argument of the function.
%
%    Output, real FX, the value of the function.
%
  n_max = 9;

  fx_vec = [ ...
     0.8646647167633873E+00, ...
     0.9996645373720975E+00, ...
     0.9999999847700203E+00, ...
     0.999999999999987E+00, ...
     0.8646647167633873E+00, ...
     0.3934693402873666E+00, ...
     0.1992625970831920E+00, ...
     0.1175030974154046E+00, ...
     0.7688365361336422E-01 ];

  sigma_vec = [ ...
     0.5000000000000000E+00, ...  
     0.5000000000000000E+00, ...
     0.5000000000000000E+00, ...
     0.5000000000000000E+00, ...
     0.1000000000000000E+01, ...
     0.2000000000000000E+01, ...
     0.3000000000000000E+01, ...
     0.4000000000000000E+01, ...
     0.5000000000000000E+01 ];

  x_vec = [ ...
     0.1000000000000000E+01, ...  
     0.2000000000000000E+01, ...  
     0.3000000000000000E+01, ...  
     0.4000000000000000E+01, ...  
     0.2000000000000000E+01, ...  
     0.2000000000000000E+01, ...  
     0.2000000000000000E+01, ...  
     0.2000000000000000E+01, ...  
     0.2000000000000000E+01 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    sigma = 0.0;
    x = 0.0;
    fx = 0.0;
  else
    sigma = sigma_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
