function pdf = poisson_pdf ( x, a )

%*****************************************************************************80
%
%% POISSON_PDF evaluates the Poisson PDF.
%
%  Formula:
%
%    PDF(X)(A) = EXP ( - A ) * A**X / X!
%
%  Discussion:
%
%    PDF(X)(A) is the probability that the number of events observed
%    in a unit time period will be X, given the expected number
%    of events in a unit time.
%
%    The parameter A is the expected number of events per unit time.
%
%    The Poisson PDF is a discrete version of the Exponential PDF.
%
%    The time interval between two Poisson events is a random
%    variable with the Exponential PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the PDF.
%    0 <= X
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0 )
    pdf = 0.0;
  else
    pdf = exp ( - a ) * a^x / i4_factorial ( x );
  end

  return
end
