function pdf = bernoulli_pdf ( x, a )

%*****************************************************************************80
%
%% BERNOULLI_PDF evaluates the Bernoulli PDF.
%
%  Discussion:
%
%    PDF(X)(A) = A**X * ( 1.0D+00 - A )**( X - 1 )
%
%    X = 0 or 1.
%
%    The Bernoulli PDF describes the simple case in which a single trial
%    is carried out, with two possible outcomes, called "success" and
%    "failure"; the probability of success is A.
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
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0 )
    pdf = 0.0;
  elseif ( x == 0 )
    pdf = 1.0 - a;
  elseif ( x == 1 )
    pdf = a;
  else
    pdf = 0.0;
  end

  return
end
