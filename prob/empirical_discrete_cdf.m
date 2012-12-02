function cdf = empirical_discrete_cdf ( x, a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_CDF evaluates the Empirical Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
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
%    Output, real CDF, the value of the CDF.
%
  cdf = 0.0;

  bsum = sum ( b(1:a) );

  for i = 1 : a

    if ( x < c(i) )
      return
    end

    cdf = cdf + b(i) / bsum;

  end

  return
end
