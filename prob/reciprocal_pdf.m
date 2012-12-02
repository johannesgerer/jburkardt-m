function pdf = reciprocal_pdf ( x, a, b )

%*****************************************************************************80
%
%% RECIPROCAL_PDF evaluates the Reciprocal PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = 1.0D+00 / ( X * LOG ( B / A ) )
%    for 0.0D+00 <= X
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
%    0.0 < A <= B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= 0.0 )
    pdf = 0.0;
  elseif ( 0.0 < x )
    pdf = 1.0 / ( x * log ( b / a ) );
  end

  return
end
