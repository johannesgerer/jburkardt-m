function pdf = uniform_01_pdf ( x )

%*****************************************************************************80
%
%% UNIFORM_01_PDF evaluates the Uniform 01 PDF.
%
%  Formula:
%
%    PDF(X) = 1 for 0 <= X <= 1
%           = 0 otherwise
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
%    0.0 <= X <= 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 | 1.0 < x )
    pdf = 0.0;
  else
    pdf = 1.0;
  end

  return
end
