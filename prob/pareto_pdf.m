function pdf = pareto_pdf ( x, a, b )

%*****************************************************************************80
%
%% PARETO_PDF evaluates the Pareto PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = B * A**B / X**(B+1).
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
%    A <= X
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a )
    pdf = 0.0;
  else
    pdf = b * a^b / x^( b + 1.0 );
  end

  return
end
