function [ x, seed ] = binomial_sample ( a, b, seed )

%*****************************************************************************80
%
%% BINOMIAL_SAMPLE samples the Binomial PDF.
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
%  Reference:
%
%    William Kennedy and James Gentle,
%    Algorithm BU,
%    Statistical Computing,
%    Dekker, 1980.
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0 <= B <= 1.0.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer X, a sample of the PDF.
%
%    Output, integer SEED, a seed for the random number generator.
%
  x = 0;

  for i = 1 : a

    [ u, seed ] = r8_uniform_01 ( seed );

    if ( u <= b )
      x = x + 1;
    end

  end

  return
end
