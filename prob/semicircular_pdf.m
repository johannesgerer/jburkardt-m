function pdf = semicircular_pdf ( x, a, b )

%*****************************************************************************80
%
%% SEMICIRCULAR_PDF evaluates the Semicircular PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = ( 2 / ( B * PI ) ) * SQRT ( 1 - ( ( X - A ) / B )**2 )
%    for A - B <= X <= A + B
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
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
  if ( x < a - b )

    pdf = 0.0;

  elseif ( x <= a + b )

    y = ( x - a ) / b;

    pdf = 2.0 / ( b * pi ) * sqrt ( 1.0 - y * y );

  elseif ( a + b < x )

    pdf = 0.0;

  end

  return
end
