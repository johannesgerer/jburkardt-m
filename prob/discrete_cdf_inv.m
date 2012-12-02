function x = discrete_cdf_inv ( cdf, a, b )

%*****************************************************************************80
%
%% DISCRETE_CDF_INV inverts the Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
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
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of outcomes
%    1 through A.  Each entry must be nonnegative.
%
%    Output, integer X, the corresponding argument for which
%    CDF(X-1) < CDF <= CDF(X)
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DISCRETE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'DISCRETE_CDF_INV - Fatal error!' );
  end

  b_sum = sum ( b(1:a) );

  cum = 0.0;

  for j = 1 : a

    cum = cum + b(j) / b_sum;

    if ( cdf <= cum )
      x = j;
      return
    end

  end

  x = a;

  return
end
