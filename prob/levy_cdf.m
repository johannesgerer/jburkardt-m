function cdf = levy_cdf ( x, a, b )

%*****************************************************************************80
%
%% LEVY_CDF evaluates the Levy CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%    Normally, A <= X.
%
%    Input, real A, B, the parameters of the PDF.
%    0 < B.
%
%    Output, real CDF, the value of the PDF.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  LEVY_PDF - Fatal error!\n' );
    fprintf ( 1, '  Input parameter B <= 0.0\n' );
    error ( 'LEVY_PDF - Fatal error!' );
  end

  if ( x <= a )
    cdf = 0.0;
  else
    cdf = 1.0 - error_f ( sqrt ( b / ( 2.0 * ( x - a ) ) ) );
  end

  return
end
