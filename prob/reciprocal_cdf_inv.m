function x = reciprocal_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% RECIPROCAL_CDF_INV inverts the Reciprocal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A <= B.
%
%    Output, real X, the corresponding argument of the CDF.
%
  if ( cdf <= 0.0 )
    x = 0.0;
  elseif ( 0.0 < cdf )
    x = b^cdf / a^( cdf - 1.0 );
  end

  return
end
