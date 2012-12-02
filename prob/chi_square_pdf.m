function pdf = chi_square_pdf ( x, a )

%*****************************************************************************80
%
%% CHI_SQUARE_PDF evaluates the central Chi squared PDF.
%
%  Discussion:
%
%    PDF(X)(A) =
%      EXP ( - X / 2 ) * X**((A-2)/2) / ( 2**(A/2) * GAMMA ( A/2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
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
%    1 <= A.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )
    pdf = 0.0;
  else
    b = a / 2.0;
    pdf = exp ( - 0.5 * x ) * x^( b - 1.0 ) / ( 2.0^b * gamma ( b ) );
  end

  return
end
