function pdf = multinomial_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% MULTINOMIAL_PDF computes a Multinomial PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) = Comb(A,B,X) * Product ( 1 <= I <= B ) C(I)**X(I)
%
%    where Comb(A,B,X) is the multinomial coefficient
%      C( A; X(1), X(2), ..., X(B) )
%
%    PDF(X)(A,B,C) is the probability that in A trials there
%    will be exactly X(I) occurrences of event I, whose probability
%    on one trial is C(I), for I from 1 to B.
%
%    As soon as A or B gets large, the number of possible X's explodes,
%    and the probability of any particular X can become extremely small.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X(B); X(I) counts the number of occurrences of
%    outcome I, out of the total of A trials.
%
%    Input, integer A, the total number of trials.
%
%    Input, integer B, the number of different possible outcomes on
%    one trial.
%
%    Input, real C(B); C(I) is the probability of outcome I on
%    any one trial.
%
%    Output, real PDF, the value of the multinomial PDF.
%

%
%  To try to avoid overflow, do the calculation in terms of logarithms.
%  Note that Gamma(A+1) = A factorial.
%
  pdf_log = gammaln ( a + 1 );

  for i = 1 : b
    pdf_log = pdf_log + x(i) * log ( c(i) ) - gammaln ( x(i) + 1 );
  end

  pdf = exp ( pdf_log );

  return
end
