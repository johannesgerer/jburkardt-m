function s = asset_path ( s0, mu, sigma, t1, n )

%*****************************************************************************80
%
%% ASSET_PATH simulates the behavior of an asset price over time.
%
%  Modified:
%
%    12 February 2012
%
%  Author:
%
%    Desmond Higham
%
%  Reference:
%
%    Desmond Higham,
%    Black-Scholes for Scientific Computing Students,
%    Computing in Science and Engineering,
%    November/December 2004, Volume 6, Number 6, pages 72-79.
%
%  Parameters:
%
%    Input, real S0, the asset price at time 0.
%
%    Input, real MU, the expected growth rate.
%
%    Input, real SIGMA, the volatility of the asset.
%
%    Input, real T1, the expiry date.
%
%    Input, integer N, the number of steps to take between 0 and T1.
%
%    Output, real S(N+1), the option values from time 0 to T1 in equal steps.
%
  dt = t1 / n;

  s = s0 * cumprod ( exp ( ( mu - sigma^2 ) * dt ...
    + sigma * sqrt ( dt ) * randn ( n, 1 ) ) );
%
%  Prepend the initial value.
%
  s = [ s0; s ];

  return
end
