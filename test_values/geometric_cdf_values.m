function [ n_data, x, p, cdf ] = geometric_cdf_values ( n_data )

%*****************************************************************************80
%
%% GEOMETRIC_CDF_VALUES returns values of the geometric CDF.
%
%  Discussion:
%
%    The geometric or Pascal probability density function gives the 
%    probability that the first success will happen on the X-th Bernoulli 
%    trial, given that the probability of a success on a single trial is P.
%
%    The value of CDF ( X, P ) is the probability that the first success
%    will happen on or before the X-th trial.
%
%    In Mathematica, the function can be evaluated by:
%
%      Needs["Statistics`DiscreteDistributions`]
%      dist = GeometricDistribution [ p ]
%      CDF [ dist, x ]
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
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%    Daniel Zwillinger and Stephen Kokoska,
%    CRC Standard Probability and Statistics Tables and Formulae,
%    Chapman and Hall / CRC Press, 2000.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer X, the number of trials.
%
%    Output, real P, the probability of success 
%    on one trial.
%
%    Output, real CDF, the cumulative density function.
%
  n_max = 14;

  cdf_vec = [ ...
     0.1900000000000000E+00, ...
     0.2710000000000000E+00, ...
     0.3439000000000000E+00, ...
     0.6861894039100000E+00, ...
     0.3600000000000000E+00, ...
     0.4880000000000000E+00, ...
     0.5904000000000000E+00, ...
     0.9141006540800000E+00, ...
     0.7599000000000000E+00, ...
     0.8704000000000000E+00, ...
     0.9375000000000000E+00, ...
     0.9843750000000000E+00, ...
     0.9995117187500000E+00, ...
     0.9999000000000000E+00 ];

  p_vec = [ ...
     0.1E+00, ...
     0.1E+00, ...
     0.1E+00, ...
     0.1E+00, ...
     0.2E+00, ...
     0.2E+00, ...
     0.2E+00, ...
     0.2E+00, ...
     0.3E+00, ...
     0.4E+00, ...
     0.5E+00, ...
     0.5E+00, ...
     0.5E+00, ...
     0.9E+00 ];

  x_vec = [ ...
    1,  2,  3, 10, 1, ...
    2,  3, 10,  3, 3, ... 
    3,  5, 10,  3 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    x = 0;
    p = 0.0;
    cdf = 0.0;
  else
    x = x_vec(n_data);
    p = p_vec(n_data);
    cdf = cdf_vec(n_data);
  end

  return
end
