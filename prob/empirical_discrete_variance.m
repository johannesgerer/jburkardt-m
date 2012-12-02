function variance = empirical_discrete_variance ( a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_VARIANCE returns the variance of the Empirical Discrete PDF.
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
%    Input, integer A, the number of values.
%    0 < A.
%
%    Input, real B(A), the weights of each value.
%    0 <= B(1:A) and at least one value is nonzero.
%
%    Input, real C(A), the values.
%    The values must be distinct and in ascending order.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  bsum = sum ( b(1:a) );

  mean = empirical_discrete_mean ( a, b, c );

  variance = 0.0;

  for i = 1 : a
    variance = variance + ( b(i) / bsum ) * ( c(i) - mean )^2;
  end

  return
end
