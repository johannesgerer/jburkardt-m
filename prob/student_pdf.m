function pdf = student_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% STUDENT_PDF evaluates the central Student T PDF.
%
%  Formula:
%
%    PDF(X)(A,B,C) = Gamma ( (C+1)/2 ) /
%      ( Gamma ( C / 2 ) * Sqrt ( PI * C )
%      * ( 1 + ((X-A)/B)**2/C )**(C + 1/2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, shape parameters of the PDF,
%    used to transform the argument X to a shifted and scaled 
%    value Y = ( X - A ) / B.  It is required that B be nonzero.
%    For the standard distribution, A = 0 and B = 1.
%
%    Input, real C, is usually called the number of 
%    degrees of freedom of the distribution.  C is typically an 
%    integer, but that is not essential.  It is required that
%    C be strictly positive.
%
%    Output, real PDF, the value of the PDF.
%
  y = ( x - a ) / b;

  pdf = gamma ( 0.5 * ( c + 1.0 ) ) / ( sqrt ( pi * c ) * gamma ( 0.5 * c ) ...
    * sqrt ( ( 1.0 + y * y / c )^( 2 * c + 1.0 ) ) );

  return
end
