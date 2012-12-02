function pdf = laplace_pdf ( x, a, b )

%*****************************************************************************80
%
%% LAPLACE_PDF evaluates the Laplace PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = exp ( - abs ( X - A ) / B ) / ( 2 * B )
%
%    The Laplace PDF is also known as the Double Exponential PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = exp ( - abs ( x - a ) / b ) / ( 2.0 * b );

  return
end
