function value = normal_ms_moment_values ( order, mu, sigma )

%*****************************************************************************80
%
%% NORMAL_MS_MOMENT_VALUES evaluates moments 0 through 8 of the Normal PDF.
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
%    0 <= ORDER <= 8.
%
%    Input, real MU, the mean of the distribution.
%
%    Input, real SIGMA, the standard deviation of the distribution.
%
%    Output, real VALUE, the value of the central moment.
%
  if ( order == 0 )
    value = 1.0;
  elseif ( order == 1 )
    value = mu;
  elseif ( order == 2 )
    value = mu^2 + sigma^2;
  elseif ( order == 3 )
    value = mu^3 + 3.0 * mu * sigma^2;
  elseif ( order == 4 )
    value = mu^4 + 6.0 * mu^2 * sigma^2 + 3.0 * sigma^4;
  elseif ( order == 5 )
    value = mu^5 + 10.0 * mu^3 * sigma^2 + 15.0 * mu * sigma^4;
  elseif ( order == 6 )
    value = mu^6 + 15.0 * mu^4 * sigma^2 + 45.0 * mu^2 * sigma^4 ...
      + 15.0 * sigma^6;
  elseif ( order == 7 )
    value = mu^7 + 21.0 * mu^5 * sigma^2 + 105.0 * mu^3 * sigma^4 ...
      + 105.0 * mu * sigma^6;
  elseif ( order == 8 )
    value = mu^8 + 28.0 * mu^6 * sigma^2 + 210.0 * mu^4 * sigma^4 ...
      + 420.0 * mu^2 * sigma^6 + 105.0 * sigma^8;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NORMAL_MS_MOMENT_VALUES - Fatal error!\n' );
    fprintf ( 1, '  Only ORDERS 0 through 8 are available.\n' );
    error ( 'NORMAL_MS_MOMENT_VALUES - Fatal error!' );
  end

  return
end
