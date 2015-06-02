function conf = mc ( s0, e, r, sigma, t1, m )

%*****************************************************************************80
%
%% MC uses Monte Carlo valuation on a European call.
%
%  Modified:
%
%    25 March 2005
%
%  Author:
%
%    Original MATLAB version by Desmond Higham
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
%    Input, real E, the exercise price.
%
%    Input, real R, the interest rate.
%
%    Input, real SIGMA, the volatility of the asset.
%
%    Input, real T1, the expiry date.
%
%    Input, integer M, the number of simulations.
%
%    Output, real CONF[2], the estimated range of the valuation.
%
  svals(1:m,1) = s0 * exp ( ( r - 0.5 * sigma^2 ) * t1 ...
    + sigma * sqrt ( t1 ) * randn ( m, 1 ) );

  pvals(1:m,1) = exp ( - r * t1 ) * max ( svals(1:m,1) - e, 0.0 );

  pmean = mean ( pvals(1:m,1) );

  width = 1.96 * std ( pvals(1:m,1) ) / sqrt ( m );

  conf = [ pmean - width, pmean + width ];

  return
end
