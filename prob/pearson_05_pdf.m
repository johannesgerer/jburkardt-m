function pdf = pearson_05_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% PEARSON_05_PDF evaluates the Pearson 5 PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = A**B * ( X - C )**(-B-1)
%      * exp ( - A / ( X - C ) ) / Gamma ( B )
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
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    C < X
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= c )
    pdf = 0.0;
  else
    pdf = a^b * ( x - c )^( - b - 1.0 ) * exp ( - a / ( x - c ) ) / gamma ( b );
  end

  return
end
