function x = levy_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% LEVY_CDF_INV inverts the Levy CDF.
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
%    Input, real CDF, the value of the CDF.
%    0.0D+00 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0 < B.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEVY_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'LEVY_CDF_INV - Fatal error!' );
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEVY_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  Input parameter B <= 0.0\n' );
    error ( 'LEVY_CDF_INV - Fatal error!' );
  end

  cdf1 = 1.0 - 0.5 * cdf;
  x1 = normal_01_cdf_inv ( cdf1 );
  x = a + b / ( x1 * x1 );

  return
end
