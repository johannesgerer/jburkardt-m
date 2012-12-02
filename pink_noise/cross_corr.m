function r = cross_corr ( n, x, y, m )

%*****************************************************************************80
%
%% CROSS_CORR computes the sample cross correlation between two signal samples.
%
%  Discussion:
%
%    The sample cross correlation is defined, for 0 <= i < N, as
%
%      R(i) = 1/N * sum ( 0 <= j <= N - 1 - i ) X(i+j) * Y(j)
%
%    The sample cross correlation is an estimate of the cross
%    correlation function.
%
%    It is usually the case that the signals X and Y are assumed to
%    have zero mean.  Here, we compute the means and adjust the
%    calculation accordingly:
%
%      R(i) = 1/N * sum ( 0 <= j <= N - 1 - i )
%        ( X(i+j) - Xbar ) * ( Y(j) - Ybar )
%
%    Experience suggests that only the first 5 or 10 percent of
%    the lags are statistically reliable, so that one might choose
%    M = N / 20 or M = N / 10, for instance.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Sophocles Orfanidis,
%    Introduction to Signal Processing,
%    Prentice-Hall, 1995,
%    ISBN: 0-13-209172-0,
%    LC: TK5102.5.O246.
%
%  Parameters:
%
%    Input, integer N, the number of equally spaced signal
%    samples.
%
%    Input, real X(N), Y(N), the signal samples.
%
%    Input, integer M, the maximum lag to consider.
%    0 <= M < N.
%
%    Output, real R(1:M+1), the sample correlations.
%
  r(1:m+1) = 0.0D+00

  xbar = sum ( x(1:n) ) / n;
  ybar = sum ( y(1:n) ) / n;

  for i = 0 : m
    for j = 0 : n - i - 1
      r(i+1) = r(i+1) + ( x(i+j+1) - xbar ) * ( y(j+1) - ybar )
    end
  end

  r(1:m+1) = r(1:m+1) / n;

  return
end
