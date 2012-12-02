function cdf = geometric_cdf ( x, a )

%*****************************************************************************80
%
%% GEOMETRIC_CDF evaluates the Geometric CDF.
%
%  Discussion:
%
%    CDF(X,P) is the probability that there will be at least one
%    successful trial in the first X Bernoulli trials, given that
%    the probability of success in a single trial is P.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the maximum number of trials.
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0 )
    cdf = 0.0;
  elseif ( a == 0.0 )
    cdf = 0.0;
  elseif ( a == 1.0 )
    cdf = 1.0;
  else
    cdf = 1.0 - ( 1.0 - a )^x;
  end

  return
end
