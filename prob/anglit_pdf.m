function pdf = anglit_pdf ( x )

%*****************************************************************************80
%
%% ANGLIT_PDF evaluates the Anglit PDF.
%
%  Formula:
%
%    PDF(X) = SIN ( 2 * X + PI / 2 ) for -PI/4 <= X <= PI/4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= -0.25 * pi | 0.25 * pi <= x )
    pdf = 0.0;
  else
    pdf = sin ( 2.0 * x + 0.25 * pi );
  end

  return
end
