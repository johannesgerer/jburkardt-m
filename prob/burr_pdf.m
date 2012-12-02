function pdf = burr_pdf ( x, a, b, c, d )

%*****************************************************************************80
%
%% BURR_PDF evaluates the Burr PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C,D) = ( C * D / B ) * ( ( X - A ) / B )**( - C - 1 )
%      * ( 1 + ( ( X - A ) / B )**( - C ) )**( - D - 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    M E Johnson,
%    Multivariate Statistical Simulation,
%    Wiley, New York, 1987.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    A <= X
%
%    Input, real A, B, C, D, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )
    pdf = 0.0;
  else

    y = ( x - a ) / b;

    pdf = ( c * d / b ) * y^( - c - 1.0 ) * ( 1.0 + y^( -c ) )^( - d - 1.0 );

  end

  return
end
