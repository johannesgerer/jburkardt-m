function pdf = half_normal_pdf ( x, a, b )

%*****************************************************************************80
%
%% HALF_NORMAL_PDF evaluates the Half Normal PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) =
%      SQRT ( 2 / PI ) * ( 1 / B ) * EXP ( - 0.5D+00 * ( ( X - A ) / B )**2 )
%
%    for A <= X
%
%    The Half Normal PDF is a special case of both the Chi PDF and the
%    Folded Normal PDF.
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
%    A <= X
%
%    Input, real  A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  else

    y = ( x - a ) / b;

    pdf = sqrt ( 2.0 / pi ) * ( 1.0 / b ) * exp ( - 0.5 * y * y );

  end

  return
end
