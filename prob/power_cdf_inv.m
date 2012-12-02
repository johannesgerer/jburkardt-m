function x = power_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% POWER_CDF_INV inverts the Power CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A, 0.0 < B.
%
%    Output, real X, the argument of the CDF.
%
  if ( cdf <= 0.0 )
    x = 0.0;
  elseif ( cdf < 1.0 )
    x = b * exp ( log ( cdf ) / a );
  else
    x = b;
  end

  return
end
