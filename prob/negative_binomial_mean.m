function mean = negative_binomial_mean ( a, b )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_MEAN returns the mean of the Negative Binomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, a parameter of the PDF.
%    0 <= A.
%
%    Input, real B, a parameter of the PDF.
%    0 < B <= 1.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = a / b;

  return
end
