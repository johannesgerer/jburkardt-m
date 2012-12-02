function cdf = binomial_cdf ( x, a, b )

%*****************************************************************************80
%
%% BINOMIAL_CDF evaluates the Binomial CDF.
%
%  Discussion:
%
%    CDF(X)(A,B) is the probability of at most X successes in A trials,
%    given that the probability of success on a single trial is B.
%
%    A sequence of trials with fixed probability of success on
%    any trial is known as a sequence of Bernoulli trials.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the desired number of successes.
%    0 <= X <= A.
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0D+00 <= B <= 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 )

    cdf = 0.0;

  elseif ( a <= x )

    cdf = 1.0;

  elseif ( b == 0.0 )

    cdf = 1.0;

  elseif ( b == 1.0 )

    cdf = 0.0;

  else

    cdf = 0.0;

    for j = 0 : x

      cnk = binomial_coef ( a, j );

      pr = cnk * b^j * ( 1.0 - b )^( a - j );

      cdf = cdf + pr;

    end

  end

  return
end
