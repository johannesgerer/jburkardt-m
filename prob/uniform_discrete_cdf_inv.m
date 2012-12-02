function x = uniform_discrete_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_CDF_INV inverts the Uniform Discrete CDF.
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
%    Input, integer A, B, the parameters of the PDF.
%    A <= B.
%
%    Output, integer X, the smallest argument whose CDF is greater
%    than or equal to CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UNIFORM_DISCRETE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'UNIFORM_DISCRETE_CDF_INV - Fatal error!' );
  end

  a2 = a - 0.5;
  b2 = b + 0.5;
  x2 = a + cdf * ( b2 - a2 );

  x = round ( x2 );

  x = max ( x, a );
  x = min ( x, b );

  return
end
