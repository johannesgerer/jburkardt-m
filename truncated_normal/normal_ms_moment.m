function value = normal_ms_moment ( order, mu, sigma )

%*****************************************************************************80
%
%% NORMAL_MS_MOMENT evaluates moments of the Normal PDF.
%
%  Discussion:
%
%    The formula was posted by John D Cook.
%
%    Order  Moment
%    -----  ------
%      0    1
%      1    mu
%      2    mu^2 +         sigma^2
%      3    mu^3 +  3 mu   sigma^2
%      4    mu^4 +  6 mu^2 sigma^2 +   3      sigma^4
%      5    mu^5 + 10 mu^3 sigma^2 +  15 mu   sigma^4
%      6    mu^6 + 15 mu^4 sigma^2 +  45 mu^2 sigma^4 +  15      sigma^6
%      7    mu^7 + 21 mu^5 sigma^2 + 105 mu^3 sigma^4 + 105 mu   sigma^6
%      8    mu^8 + 28 mu^6 sigma^2 + 210 mu^4 sigma^4 + 420 mu^2 sigma^6 + 105 sigma^8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the moment.
%    0 <= ORDER.
%
%    Input, real MU, the mean of the distribution.
%
%    Input, real SIGMA, the standard deviation of the distribution.
%
%    Output, real VALUE, the value of the central moment.
%
  j_hi = floor ( order / 2 );

  value = 0.0;
  for j = 0 : j_hi
    value = value ...
      + r8_choose ( order, 2 * j ) ...
      * r8_factorial2 ( 2 * j - 1 ) ...
      * mu ^ ( order - 2 * j ) * sigma ^ ( 2 * j );
  end

  return
end
