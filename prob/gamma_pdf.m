function pdf = gamma_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% GAMMA_PDF evaluates the Gamma PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) = EXP ( - ( X - A ) / B ) * ( ( X - A ) / B )^(C-1)
%      / ( B * GAMMA ( C ) )
%
%    GAMMA_PDF(A,B,C), where C is an integer, is the Erlang PDF.
%    GAMMA_PDF(A,B,1) is the Exponential PDF.
%    GAMMA_PDF(0,2,C/2) is the Chi Squared PDF with C degrees of freedom.
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
%    A <= X.
%
%    Input, real A, B, C, the parameters of the PDF.
%    A controls the location of the peak;  A is often chosen to be 0.0.
%    B is the "scale" parameter; 0.0 < B, and is often 1.0.
%    C is the "shape" parameter; 0.0 < C, and is often 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  else

    y = ( x - a ) / b;

    pdf = y^( c - 1.0 ) / ( b * gamma ( c ) * exp ( y ) );

  end

  return
end
