function pdf = levy_pdf ( x, a, b )

%*****************************************************************************80
%
%% LEVY_PDF evaluates the Levy PDF.
%
%  Discussion:
%
%    PDF(A,B;X) = sqrt ( B / ( 2 * PI ) )
%               * exp ( - B / ( 2 * ( X - A ) ) 
%               / ( X - A )^(3/2)
%
%    for A <= X.
%
%    Note that the Levy PDF does not have a finite mean or variance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    Normally, A <= X.
%
%    Input, real A, B, the parameters of the PDF.
%    0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  LEVY_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter B <= 0.0\n' );
    error ( 'LEVY_PDF - Fatal error!' );
  end

  if ( x < a )
    pdf = 0.0;
  else
    pdf = sqrt ( b / ( 2.0 * pi ) ) ...
        * exp ( - b / ( 2.0 * ( x - a ) ) ) ...
        / sqrt ( ( x - a )^3 );
  end

  return
end
