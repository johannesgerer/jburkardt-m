function pdf = nakagami_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% NAKAGAMI_PDF evaluates the Nakagami PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, C, the parameters of the PDF.
%    0.0 < B
%    0.0 < C.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x <= 0.0 )

    pdf = 0.0;

  elseif ( 0.0 < x )

    y = ( x - a ) / b;

    pdf = 2.0 * c^c / ( b * gamma ( c ) ) * y^( 2.0 * c - 1.0 ) * exp ( -c * y * y );

  end

  return
end
