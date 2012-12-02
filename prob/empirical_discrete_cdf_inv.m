function x = empirical_discrete_cdf_inv ( cdf, a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_CDF_INV inverts the Empirical Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2004
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
%    Input, integer A, the number of values.
%    0 < A.
%
%    Input, real B(A), the weights of each value.
%    0 <= B(1:A) and at least one value is nonzero.
%
%    Input, real C(A), the values.
%    The values must be distinct and in ascending order.
%
%    Output, real X, the smallest argument whose CDF is greater
%    than or equal to CDF.
%
  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EMPIRICAL_DISCRETE_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'EMPIRICAL_DISCRETE_CDF_INV - Fatal error!' );
  end

  bsum = sum ( b(1:a) );

  x = c(1);
  cdf2 = b(1) / bsum;

  for i = 2 : a

    if ( cdf <= cdf2 )
      return
    end

    x = c(i);
    cdf2 = cdf2 + b(i) / bsum;

  end

  return
end
