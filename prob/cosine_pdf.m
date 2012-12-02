function pdf = cosine_pdf ( x, a, b )

%*****************************************************************************80
%
%% COSINE_PDF evaluates the Cosine PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = ( 1 / ( 2 * PI * B ) ) * COS ( ( X - A ) / B )
%    for A - PI * B <= X <= A + PI * B
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
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
  if ( x < a - pi * b )

    pdf = 0.0;

  elseif ( x <= a + pi * b )

    y = ( x - a ) / b;

    pdf = 1.0 / ( 2.0 * pi * b ) * cos ( y );

  elseif ( a + pi * b < x )

    pdf = 0.0;

  end

  return
end
