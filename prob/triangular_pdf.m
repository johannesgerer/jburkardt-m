function pdf = triangular_pdf ( x, a, b )

%*****************************************************************************80
%
%% TRIANGULAR_PDF evaluates the Triangular PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = 4 * ( X - A ) / ( B - A )**2 for  A <= X <= (A+B)/2
%               = 4 * ( B - X ) / ( B - A )**2 for  (A+B)/2 <= X <= B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
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
%    A < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )
    pdf = 0.0;
  elseif ( x <= 0.5 * ( a + b ) )
    pdf = 4.0 * ( x - a ) / ( b - a )^2;
  elseif ( x <= b )
    pdf = 4.0 * ( b - x ) / ( b - a )^2;
  else
    pdf = 0.0;
  end

  return
end
