function pdf = inverse_gaussian_pdf ( x, a, b )

%*****************************************************************************80
%
%% INVERSE_GAUSSIAN_PDF evaluates the Inverse Gaussian PDF.
%
%  Discussion:
%
%    The Inverse Gaussian PDF is also known as the Wald PDF
%    and the Inverse Normal PDF.
%
%    PDF(X)(A,B)
%      = SQRT ( B / ( 2 * PI * X**3 ) )
%        * EXP ( - B * ( X - A )**2 / ( 2.0D+00 * A**2 * X ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 < X
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= 0.0 )
    pdf = 0.0;
  else
    pdf = sqrt ( b / ( 2.0 * pi * x^3 ) ) * ...
      exp ( - b * ( x - a )^2 / ( 2.0 * a^2 * x ) );
  end

  return
end
