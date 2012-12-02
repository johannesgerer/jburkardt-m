function mean = empirical_discrete_mean ( a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_MEAN returns the mean of the Empirical Discrete PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  mean = ( b(1:a) * c(1:a)' ) / sum ( b(1:a) );

  return
end
