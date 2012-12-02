function pdf = cardioid_pdf ( x, a, b )

%*****************************************************************************80
%
%% CARDIOID_PDF evaluates the Cardioid PDF.
%
%  Discussion:
%
%    The cardioid PDF can be thought of as being applied to points on
%    a circle.  Compare this distribution with the "Cosine PDF".
%
%    PDF(A,B;X) = ( 1 / ( 2 * PI ) ) * ( 1 + 2 * B * COS ( X - A ) )
%    for 0 <= B <= 1/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    N I Fisher,
%    Statistical Analysis of Circular Data,
%    Cambridge, 1993.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= B <= 0.5.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = ( 1.0 + 2.0 * b * cos ( x - a ) ) / ( 2.0 * pi );

  return
end
