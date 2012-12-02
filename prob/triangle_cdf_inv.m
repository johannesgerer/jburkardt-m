function x = triangle_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% TRIANGLE_CDF_INV inverts the Triangle CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, C, the parameters of the PDF.
%    A <= B <= C and A < C.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'TRIANGLE_CDF_INV - Fatal error!' );
  end

  d = 2.0 / ( c - a );
  cdf_mid = 0.5 * d * ( b - a );

  if ( cdf <= cdf_mid )
    x = a + sqrt ( cdf * ( b - a ) * ( c - a ) );
  else
    x = c - sqrt ( ( c - b ) * ( ( c - b ) - ( cdf - cdf_mid ) * ( c - a ) ) );
  end

  return
end
