function pdf = erlang_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% ERLANG_PDF evaluates the Erlang PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) = ( ( X - A ) / B )**( C - 1 )
%      / ( B * Gamma ( C ) * EXP ( ( X - A ) / B ) )
%
%    for 0 < B, 0 < C integer, A <= X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, integer C, the parameters of the PDF.
%    0.0 < B.
%    0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )

    pdf = 0.0;

  else

    y = ( x - a ) / b;

    pdf = y^( c - 1 ) / ( b * i4_factorial ( c - 1 ) * exp ( y ) );

  end

  return
end
