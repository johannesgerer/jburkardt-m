function x = uniform_01_cdf_inv ( cdf )

%*****************************************************************************80
%
%% UNIFORM_01_CDF_INV inverts the Uniform 01 CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
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
%    Output, real X, the corresponding argument.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UNIFORM_01_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'UNIFORM_01_CDF_INV - Fatal error!' );
  end

  x = cdf;

  return
end
