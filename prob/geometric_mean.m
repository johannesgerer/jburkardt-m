function mean = geometric_mean ( a )

%*****************************************************************************80
%
%% GEOMETRIC_MEAN returns the mean of the Geometric PDF.
%
%  Discussion:
%
%    MEAN is the expected value of the number of trials required
%    to obtain a single success.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, real MEAN, the mean of the PDF.
%
  mean = 1.0 / a;

  return
end
