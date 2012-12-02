function pdf = exponential_01_pdf ( x )

%*****************************************************************************80
%
%% EXPONENTIAL_01_PDF evaluates the Exponential 01 PDF.
%
%  Discussion:
%
%    PDF(X) = EXP ( - X )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0D+00 <= X
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )
    pdf = 0.0;
  else
    pdf = exp ( - x );
  end

  return
end
