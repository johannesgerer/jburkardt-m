function value = normal_ms_moment_central_values ( order, mu, sigma )

%*****************************************************************************80
%
%% NORMAL_MS_MOMENT_CENTRAL_VALUES evaluates moments 0 through 10 of the Normal PDF.
%
%  Discussion:
%
%    The formula was posted by John D Cook.
%
%    Order  Moment
%    -----  ------
%      0    1
%      1    0
%      2    sigma^2
%      3    0
%      4    3 sigma^4
%      5    0
%      6    15 sigma^6
%      7    0
%      8    105 sigma^8
%      9    0
%     10    945 sigma^10
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
%    0 <= ORDER <= 10.
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
    value = 0.0;
  elseif ( order == 2 )
    value = sigma^2;
  elseif ( order == 3 )
    value = 0.0;
  elseif ( order == 4 )
    value = 3.0 * sigma^4;
  elseif ( order == 5 )
    value = 0.0;
  elseif ( order == 6 )
    value = 15.0 * sigma^6;
  elseif ( order == 7 )
    value = 0.0;
  elseif ( order == 8 )
    value = 105.0 * sigma^8;
  elseif ( order == 9 )
    value = 0.0;
  elseif ( order == 10 )
    value = 945.0 * sigma^10;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NORMAL_MS_MOMENT_CENTRAL_VALUES - Fatal error!\n' );
    fprintf ( 1, '  Only ORDERS 0 through 10 are available.\n' );
    error ( 'NORMAL_MS_MOMENT_CENTRAL_VALUES - Fatal error!' );
  end

  return
end
