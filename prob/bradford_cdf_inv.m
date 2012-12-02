function x = bradford_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% BRADFORD_CDF_INV inverts the Bradford CDF.
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
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, C, the parameters of the PDF.
%    A < B,
%    0.0 < C.
%
%    Output, real X, the corresponding argument of the CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BRADFORD_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'BRADFORD_CDF_INV - Fatal error!' );
  end

  if ( cdf <= 0.0 )
    x = a;
  elseif ( cdf < 1.0 )
    x = a + ( b - a ) * ( ( c + 1.0 )^cdf - 1.0 ) / c;
  elseif ( 1.0 <= cdf )
    x = b;
  end

  return
end
