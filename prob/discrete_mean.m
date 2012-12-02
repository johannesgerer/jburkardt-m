function mean = discrete_mean ( a, b )

%*****************************************************************************80
%
%% DISCRETE_MEAN evaluates the mean of the Discrete PDF.
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
%    Output, real MEAN, the mean of the PDF.
%
  b_sum = sum ( b(1:a) );

  mean = 0.0;
  for j = 1 : a
    mean = mean + j * b(j);
  end

  mean = mean / b_sum;

  return
end
