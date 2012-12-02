function pdf = uniform_pdf ( x, a, b )

%*****************************************************************************80
%
%% UNIFORM_PDF evaluates the Uniform PDF.
%
%  Discussion:
%
%    The Uniform PDF is also known as the "Rectangular" or "de Moivre" PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = 1 / ( B - A ) for A <= X <= B
%               = 0 otherwise
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
  if ( x < a | b < x )
    pdf = 0.0;
  else
    pdf = 1.0 / ( b - a );
  end

  return
end
