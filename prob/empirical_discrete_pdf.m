function pdf = empirical_discrete_pdf ( x, a, b, c )

%*****************************************************************************80
%
%% EMPIRICAL_DISCRETE_PDF evaluates the Empirical Discrete PDF.
%
%  Discussion:
%
%    A set of A values C(1:A) are assigned nonnegative weights B(1:A),
%    with at least one B nonzero.  The probability of C(I) is the
%    value of B(I) divided by the sum of the weights.
%
%    The C's must be distinct, and given in ascending order.
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
%    Input, real X, the argument of the PDF.
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
%    Output, real PDF, the value of the PDF.
%
  for i = 1 : a
    if ( x == c(i) )
      pdf = b(i) / sum ( b(1:a) );
      return
    end
  end

  pdf = 0.0;
 
  return
end
