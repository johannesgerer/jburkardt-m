function value = benford ( ival )

%*****************************************************************************80
%
%% BENFORD returns the Benford probability of one or more significant digits.
%
%  Discussion:
%
%    Benford's law is an empirical formula explaining the observed
%    distribution of initial digits in lists culled from newspapers,
%    tax forms, stock market prices, and so on.  It predicts the observed
%    high frequency of the initial digit 1, for instance.
%
%    Note that the probabilities of digits 1 through 9 are guaranteed
%    to add up to 1, since
%      LOG10 ( 2/1 ) + LOG10 ( 3/2) + LOG10 ( 4/3 ) + ... + LOG10 ( 10/9 )
%      = LOG10 ( 2/1 * 3/2 * 4/3 * ... * 10/9 ) = LOG10 ( 10 ) = 1.
%
%  Formula:
%
%    Prob ( First significant digits are IVAL ) =
%      LOG10 ( ( IVAL + 1 ) / IVAL ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Frank Benford,
%    The Law of Anomalous Numbers,
%    Proceedings of the American Philosophical Society,
%    Volume 78, pages 551-572, 1938.
%
%    T P Hill,
%    The First Digit Phenomenon,
%    American Scientist,
%    Volume 86, July/August 1998, pages 358 - 363.
%
%    R Raimi,
%    The Peculiar Distribution of First Digits,
%    Scientific American,
%    December 1969, pages 109-119.
%
%  Parameters:
%
%    Input, integer IVAL, the string of significant digits to be checked.
%    If IVAL is 1, then we are asking for the Benford probability that
%    a value will have first digit 1.  If IVAL is 123, we are asking for
%    the probability that the first three digits will be 123, and so on.
%    Note that IVAL must not be 0 or negative.
%
%    Output, real VALUE, the Benford probability that an item taken
%    from a real world distribution will have the initial digits IVAL.
%
  if ( ival <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BENFORD - Fatal error!\n' );
    fprintf ( 1, '  The input argument must be positive.\n' );
    fprintf ( 1, '  Your value was %d\n', ival );
    error ( 'BENFORD - Fatal error!' );
  end

  value = log10 ( ( ival + 1 ) / ival );

  return
end
