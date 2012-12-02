function variance = binomial_variance ( a, b )

%*****************************************************************************80
%
%% BINOMIAL_VARIANCE returns the variance of the Binomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%    1 <= A.
%
%    Input, real B, the probability of success on one trial.
%    0.0 <= B <= 1.0.
%
%    Output, real VARIANCE, the variance of the PDF.
%
  variance = a * b * ( 1.0 - b );

  return
end
