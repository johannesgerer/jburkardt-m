function pdf = bradford_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% BRADFORD_PDF evaluates the Bradford PDF.
%
%  Discussion:
%
%    PDF(X)(A,B,C) =
%      C / ( ( C * ( X - A ) + B - A ) * log ( C + 1 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
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
%    A < B,
%    0.0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= a )
    pdf = 0.0;
  elseif ( x <= b )
    pdf = c / ( ( c * ( x - a ) + b - a ) * log ( c + 1.0 ) );
  elseif ( b < x )
    pdf = 0.0;
  end

  return
end
