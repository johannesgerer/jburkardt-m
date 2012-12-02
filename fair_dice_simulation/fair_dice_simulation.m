function fair_dice_simulation ( n )

%*****************************************************************************80
%
%% FAIR_DICE_SIMULATION simulates N throws of two fair dice.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of times the dice are thrown.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FAIR_DICE_SIMULATION:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Simulate N throws of a pair of fair dice.\n' );

  if ( nargin < 1 )
    n = input ( 'Enter number of times the dice are thrown: ' );
  end
%
%  PDF is the probability density function for the probability of the
%  results 1 through 12, after rolling two dice.
%
  pdf = [0,1,2,3,4,5,6,5,4,3,2,1] / 36;
%
%  CDF(X) is the probability of rolling the value X or less.
%
  cdf = cumsum ( pdf );
%
%  Now we simulate rolling the dice N times.
%  SCORE(I) will hold the result we got on the I-th roll.
%
  score = zeros (n,1);
%
%  Each value of R is a random number between 0 and 1.
%
  r = rand ( n, 1 );
%
%  Each R corresponds to the result X for which CDF(X-1) < R <= CDF(X).
%
%  WHERE is a vector the same shape as R, containing a 1 for those
%  entries in R whose probability corresponds to a roll of X.
%
%  The entries of WHERE with a 1 in them will now set the corresponding
%  entries of SCORE to X.
%
  for x = 2 : 12
    where = ( cdf(x-1) < r & r <= cdf(x) );
    score ( where ) = x;
  end
%
%  Compute the frequency of each score X.
%
%  MATCH is a vector of those indices of SCORE which are equal to X.
%
%  The frequency of the result X is the same as the number of entries
%  in MATCH.
%
  for x = 1 : 12
    match = find ( score == x );
    freq(x) = length ( match );
  end
%
%  The estimated probability density is the number of occurences of
%  the given roll divided by the number of trials.
%
  for x = 1 : 12
    pdf_est(x) = freq(x) / n;
  end
%
%  Plot the estimated PDF versus the PDF
%
  x = 1 : 12;

  y(1:12,1) = pdf(1:12);
  y(1:12,2) = pdf_est(1:12);

  bar ( x, y )
  grid on
  title_string = sprintf ( 'Exact (blue) and estimated (red) PDF, N = %d', n );
  title ( title_string )
  xlabel ( 'Score' )
  ylabel ( 'Probability' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FAIR_DICE_SIMULATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
