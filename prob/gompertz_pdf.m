function pdf = gompertz_pdf ( x, a, b )

%*****************************************************************************80
%
%% GOMPERTZ_PDF evaluates the Gompertz PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) = B * A**X / exp ( B * ( A**X - 1 ) / log ( A ) )
%
%    for
%
%      0.0 <= X
%      1.0 <  A
%      0.0 <  B
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
%  Reference:
%
%    Johnson, Kotz, and Balakrishnan,
%    Continuous Univariate Distributions, Volume 2, second edition,
%    Wiley, 1994, pages 25-26.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    1 < A, 0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < 0.0 )

    pdf = 0.0;

  elseif ( 1.0 < a )

    pdf = exp ( log ( b ) + x * log ( a ) - ( b / log ( a ) ) * ( a^x - 1.0 ) );

  end

  return
end
