function cdf = bernoulli_cdf ( x, a, cdf )

%*****************************************************************************80
%
%% BERNOULLI_CDF evaluates the Bernoulli CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the number of successes on a single trial.
%    X = 0 or 1.
%
%    Input, real A, the probability of success on one trial.
%    0.0D+00 <= A <= 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 )
    cdf = 0.0;
  elseif ( x == 0 )
    cdf = 1.0 - a;
  else
    cdf = 1.0;
  end

  return
end
