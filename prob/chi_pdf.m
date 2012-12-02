function pdf = chi_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% CHI_PDF evaluates the Chi PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) = EXP ( - 0.5D+00 * ( ( X - A ) / B )**2 )
%      * ( ( X - A ) / B )**( C - 1 ) /
%      ( 2**( 0.5D+00 * C - 1 ) * B * GAMMA ( 0.5D+00 * C ) )
%
%    CHI(A,B,1) is the Half Normal PDF;
%    CHI(0,B,2) is the Rayleigh PDF;
%    CHI(0,B,3) is the Maxwell PDF.
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
%    A <= X
%
%    Input, real A, B, C, the parameters of the PDF.
%    0 < B,
%    0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  else

    y = ( x - a ) / b;

    pdf = exp ( - 0.5 * y * y ) * y^( c - 1.0 ) ...
      / ( 2.0^( 0.5 * c - 1.0 ) * b * gamma ( 0.5 * c ) );

  end

  return
end
