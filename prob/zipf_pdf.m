function pdf = zipf_pdf ( x, a )

%*****************************************************************************80
%
%% ZIPF_PDF evaluates the Zipf PDF.
%
%  Discussion:
%
%    PDF(X)(A) = ( 1 / X^A ) / C
%
%    where the normalizing constant is chosen so that
%
%    C = Sum ( 1 <= I < Infinity ) 1 / I**A.
%
%    From observation, the frequency of different words in long
%    sequences of text seems to follow the Zipf PDF, with
%    parameter A slightly greater than 1.  The Zipf PDF is sometimes
%    known as the "discrete Pareto" PDF.
%
%    Lotka's law is a version of the Zipf PDF in which A is 2 or approximately
%    2.  Lotka's law describes the frequency of publications by authors in a
%    given field, and estimates that the number of authors with X papers is
%    about 1/X^A of the number of authors with 1 paper.
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
%    Alfred Lotka,
%    The frequency distribution of scientific productivity,
%    Journal of the Washington Academy of Sciences,
%    Volume 16, Number 12, 1926, pages 317-324.
%
%  Parameters:
%
%    Input, integer X, the argument of the PDF.
%    1 <= N
%
%    Input, real A, the parameter of the PDF.
%    1.0 < A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 1 )

    pdf = 0.0;

  else

    c = zeta ( a );
    pdf = ( 1.0 / x^a ) / c;

  end

  return
end
