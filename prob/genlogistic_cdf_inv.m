function x = genlogistic_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% GENLOGISTIC_CDF_INV inverts the Generalized Logistic CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2004
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
%    0.0 < B,
%    0.0 < C.
%
%    Output, real X, the corresponding argument.
%
  if ( cdf <= 0.0 )
    x = -r8_huge ( );
  elseif ( cdf < 1.0 )
    x = a - b * log ( cdf^( - 1.0 / c ) - 1.0 );
  elseif ( 1.0 <= cdf )
    x = r8_huge ( );
  end

  return
end
