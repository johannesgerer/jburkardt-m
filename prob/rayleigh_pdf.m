function pdf = rayleigh_pdf ( x, a )

%*****************************************************************************80
%
%% RAYLEIGH_PDF evaluates the Rayleigh PDF.
%
%  Formula:
%
%    PDF(X)(A) = ( X / A**2 ) * EXP ( - X**2 / ( 2 * A**2 ) )
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
%    0.0 <= X
%
%    Input, real A, the parameter of the PDF.
%    0 < A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )
    pdf = 0.0;
  else
    pdf = ( x / ( a * a ) ) * exp ( - x * x / ( 2.0 * a * a ) );
  end

  return
end
