function pdf = normal_01_pdf ( x )

%*****************************************************************************80
%
%% NORMAL_01_PDF evaluates the Normal 01 PDF.
%
%  Discussion:
%
%    The Normal 01 PDF is also called the "Standard Normal" PDF, or
%    the Normal PDF with 0 mean and variance 1.
%
%  Formula:
%
%    PDF(x) = exp ( - 0.5 * x^2 ) / sqrt ( 2 * pi )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = exp ( -0.5 * x * x ) / sqrt ( 2.0 * pi );

  return
end
