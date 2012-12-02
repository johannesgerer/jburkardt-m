function pdf = normal_pdf ( x, a, b )

%*****************************************************************************80
%
%% NORMAL_PDF evaluates the Normal PDF.
%
%  Discussion:
%
%    The normal PDF is also known as the Gaussian PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = EXP ( - 0.5 * ( ( X - A ) / B )^2 ) / SQRT ( 2 * PI * B^2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(), the argument of the PDF.
%
%    Input, real A, a parameter of the PDF.
%    A represents the mean value of the variables.
%
%    Input, real B, a parameter of the PDF.
%    B represents the standard deviation of the variables.
%
%    Output, real PDF(), the value of the PDF.
%
  pdf = exp ( - 0.5 * ( ( x - a ) / b ).^2 )  / sqrt ( 2.0 * pi * b^2 );

  return
end
