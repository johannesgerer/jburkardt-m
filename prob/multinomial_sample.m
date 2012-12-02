function [ x, seed ] = multinomial_sample ( a, b, c, seed )

%*****************************************************************************80
%
%% MULTINOMIAL_SAMPLE samples the Multinomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Luc Devroye,
%    Non-Uniform Random Variate Generation,
%    Springer-Verlag, New York, 1986, page 559.
%
%  Parameters:
%
%    Input, integer A, the total number of trials.
%    0 <= A.
%
%    Input, integer B, the number of outcomes possible on one trial.
%    1 <= B.
%
%    Input, real C(B).  C(I) is the probability of outcome I on
%    any trial.
%    0.0 <= C(I) <= 1.0,
%    Sum ( 1 <= I <= B) C(I) = 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X(B); X(I) is the number of
%    occurrences of event I during the N trials.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  ntot = a;

  sum2 = 1.0;

  x(1:b) = 0;

  for ifactor = 1 : b - 1

    prob = c(ifactor) / sum2;
%
%  Generate a binomial random deviate for NTOT trials with
%  single trial success probability PROB.
%
    [ x(ifactor), seed ] = binomial_sample ( ntot, prob, seed );

    ntot = ntot - x(ifactor);
    if ( ntot <= 0 )
      x = x';
      return
    end

    sum2 = sum2 - c(ifactor);

  end
%
%  The last factor gets what's left.
%
  x(b) = ntot;

  x = x';
  
  return
end
