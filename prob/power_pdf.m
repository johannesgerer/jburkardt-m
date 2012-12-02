function pdf = power_pdf ( x, a, b )

%*****************************************************************************80
%
%% POWER_PDF evaluates the Power PDF.
%
%  Formula:
%
%    PDF(X)(A) = (A/B) * (X/B)**(A-1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger and Stephen Kokoska,
%    CRC Standard Probability and Statistics Tables and Formulae,
%    Chapman and Hall/CRC, 2000, pages 152-153.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 <= X <= B.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0D+00 < A, 0.0D+00 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 | b < x )
    pdf = 0.0;
  else
    pdf = ( a / b ) * ( x / b )^( a - 1.0 );
  end

  return
end
