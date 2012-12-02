function pdf = folded_normal_pdf ( x, a, b )

%*****************************************************************************80
%
%% FOLDED_NORMAL_PDF evaluates the Folded Normal PDF.
%
%  Discussion:
%
%    PDF(X)(A) = SQRT ( 2 / PI ) * ( 1 / B ) * COSH ( A * X / B**2 )
%      * EXP ( - 0.5D+00 * ( X**2 + A**2 ) / B**2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
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
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A,
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )
    pdf = 0.0;
  else
    pdf = sqrt ( 2.0 / pi ) * ( 1.0 / b ) * cosh ( a * x / ( b * b ) ) ...
      * exp ( -0.5 * ( x * x + a * a ) / ( b * b ) );
  end

 return
end
