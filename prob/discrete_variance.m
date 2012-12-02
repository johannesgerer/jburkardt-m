function variance = discrete_variance ( a, b )

%*****************************************************************************80
%
%% DISCRETE_VARIANCE evaluates the variance of the Discrete PDF.
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
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of
%    outcomes 1 through A.  Each entry must be nonnegative.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  b_sum = sum ( b(1:a) );

  mean = 0.0;
  for j = 1 : a
    mean = mean + j * b(j);
  end

  mean = mean / b_sum;

  variance = 0.0;
  for j = 1 : a
    variance = variance + b(j) * ( j - mean ) * ( j - mean );
  end

  variance = variance / b_sum;

  return
end
