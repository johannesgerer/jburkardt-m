function pdf = frechet_pdf ( x, alpha )

%*****************************************************************************80
%
%% FRECHET_PDF evaluates the Frechet PDF.
%
%  Discussion:
%
%    PDF(X) = ALPHA * exp ( -1 / X^ALPHA ) / X^(ALPHA+1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real ALPHA, the parameter.
%    It is required that 0.0 < ALPHA.
%
%    Output, real PDF, the value of the PDF.
%
  if ( alpha <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FRECHET_PDF - Fatal error%\n' );
    fprintf ( 1, '  ALPHA <= 0.0.\n' );
    error ( 'FRECHET_PDF - Fatal error%' );
  end

  pdf = alpha * exp ( - 1.0 / x^alpha ) / x^( alpha + 1.0 );

  return
end
