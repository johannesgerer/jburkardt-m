function pdf = uniform_discrete_pdf ( x, a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_PDF evaluates the Uniform discrete PDF.
%
%  Discussion:
%
%    The Uniform Discrete PDF is also known as the "Rectangular"
%    Discrete PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = 1 / ( B + 1 - A ) for A <= X <= B.
%
%    The parameters define the interval of integers
%    for which the PDF is nonzero.
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
%    Input, integer X, the argument of the PDF.
%
%    Input, integer A, B, the parameters of the PDF.
%    A <= B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a | b < x )
    pdf = 0.0;
  else
    pdf = 1.0 / ( b + 1 - a );
  end

  return
end
