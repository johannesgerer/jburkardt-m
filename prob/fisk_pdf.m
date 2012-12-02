function pdf = fisk_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% FISK_PDF evaluates the Fisk PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) =
%      ( C / B ) * ( ( X - A ) / B )**( C - 1 ) /
%      ( 1 + ( ( X - A ) / B )**C )**2
%
%    The Fisk PDF is also known as the Log Logistic PDF.
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
%    A <= X
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B,
%    0.0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  else

    y = ( x - a ) / b;

    pdf = ( c / b ) * y^( c - 1.0 ) / ( 1.0 + y^c )^2;

  end

  return
end
