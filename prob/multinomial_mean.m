function mean = multinomial_mean ( a, b, c )

%*****************************************************************************80
%
%% MULTINOMIAL_MEAN returns the means of the Multinomial PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the number of trials.
%
%    Input, integer B, the number of outcomes possible on one trial.
%    1 <= B.
%
%    Input, real C(B).  C(I) is the probability of outcome I on
%    any trial.
%    0.0 <= C(I) <= 1.0,
%    Sum ( 1 <= I <= B) C(I) = 1.0.
%
%    Output, real MEAN(B), MEAN(I) is the expected value of the
%    number of outcome I in N trials.
%
  mean(1:b) = a * c(1:b);

  return
end
