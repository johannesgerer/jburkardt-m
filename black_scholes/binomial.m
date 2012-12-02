function c = binomial ( s0, e, r, sigma, t1, m )

%*****************************************************************************80
%
%% BINOMIAL uses the binomial method for a European call.
%
%  Modified:
%
%    28 March 2005
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
%    Input, real E, the exercise price.
%
%    Input, real R, the interest rate.
%
%    Input, real SIGMA, the volatility of the asset.
%
%    Input, real T1, the expiry date.
%
%    Input, integer M, the number of steps to take between 0 and T1.
%
%    Output, real C, the option value at time 0.
%
  dt = t1 / m;
  a = 0.5 * ( exp ( - r * dt ) + exp ( ( r + sigma^2 ) * dt ) );
  d = a - sqrt ( a^2 - 1.0 );
  u = a + sqrt ( a^2 - 1.0 );
  p = ( exp ( r * dt ) - d ) / ( u - d );
  w = max ( s0 * d .^ ( [m:-1:0]' ) .* u .^ ( [0:m]' ) - e, 0.0 );
%
%  Trace backwards to get the option value at time 0.
%
  b = ( 1.0 - p ) * eye ( m+1, m+1 ) + p * diag ( ones ( m, 1 ), 1 );

  for i = m : -1 : 1
    w = b(1:i,1:i+1) * w;
  end

  w = exp ( - r * t1 ) * w;

  c = w(1);

  return
end
