function pdf = negative_binomial_pdf ( x, a, b )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_PDF evaluates the Negative Binomial PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = C(X-1,A-1) * B**A * ( 1 - B )**(X-A)
%
%  Discussion:
%
%    PDF(X)(A,B) is the probability that the A-th success will
%    occur on the X-th trial, given that the probability
%    of a success on a single trial is B.
%
%    The Negative Binomial PDF is also known as the Pascal PDF or
%    the "Polya" PDF.
%
%    NEGATIVE_BINOMIAL_PDF(X)(1,B) = GEOMETRIC_PDF(X)(B)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the number of trials.
%    A <= X.
%
%    Input, integer A, the number of successes required.
%    0 <= A <= X, normally.
%
%    Input, real B, the probability of a success on a single trial.
%    0.0D+00 < B <= 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a )

    pdf = 0.0;

  else

    cnk = binomial_coef ( x-1, a-1 );

    pdf = cnk * b^a * ( 1.0 - b )^( x - a );

  end

  return
end
