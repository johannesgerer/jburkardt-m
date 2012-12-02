function x = bernoulli_cdf_inv ( cdf, a )

%*****************************************************************************80
%
%% BERNOULLI_CDF_INV inverts the Bernoulli CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
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
%    Input, real A, the parameter of the PDF.
%    0.0D+00 <= A <= 1.0.
%
%    Output, integer X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BERNOULLI_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'BERNOULLI_CDF_INV - Fatal error!' );
  end

  if ( cdf <= 1.0 - a )
    x = 0;
  else
    x = 1;
  end

  return
end
