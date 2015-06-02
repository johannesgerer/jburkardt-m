function value = i4vec_multinomial_pdf ( n, p, m, x )

%*****************************************************************************80
%
%% I4VEC_MULTINOMIAL_PDF evaluates the multinomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the number of trials.
%
%    Input, real P(M), the probability of each outcome
%    on any single trial.
%
%    Input, integer M, the number of possible outcomes
%    of a single trial.
%
%    Input, integer X(M), the results of N trials,
%    with X(I) the number of times outcome I occurred.
%
%    Output, real VALUE, the probability
%    density function evaluated at X.
%

%
%  The combinatorial coefficient is an integer.
%
  c = 1;
  top = n;
  for i = 1 : m
    bot = 1;
    do j = 1 : x(i)
      c = ( c * top ) / bot;
      top = top - 1;
      bot = bot + 1;
    end
  end

  value = c;
  for i = 1 : m
    value = value * p(i) ^ x(i);
  end

  return
end