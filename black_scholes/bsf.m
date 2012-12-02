function c = bsf ( s0, t0, e, r, sigma, t1 )

%*****************************************************************************80
%
%% BSF evaluates the Black-Scholes formula for a European call.
%
%  Modified:
%
%    25 March 2005
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
%    Input, real S0, the asset price at time T0.
%
%    Input, real T0, the time at which the asset price is known.
%
%    Input, real E, the exercise price.
%
%    Input, real R, the interest rate.
%
%    Input, real SIGMA, the volatility of the asset.
%
%    Input, real T1, the expiry date.
%
%    Output, real C, the value of the call option.
%
  tau = t1 - t0;

  if ( 0.0 < tau )

    d1 = ( log ( s0 / e ) + ( r + 0.5 * sigma^2 ) * tau ) ...
      / ( sigma * sqrt ( tau ) );

    d2 = d1 - sigma * sqrt ( tau );

    n1 = 0.5 * ( 1.0 + erf ( d1 / sqrt ( 2.0 ) ) );
    n2 = 0.5 * ( 1.0 + erf ( d2 / sqrt ( 2.0 ) ) );

    c = s0 * n1 - e * exp ( - r * tau ) * n2;

  else

    c = max ( s0 - e, 0.0 );

  end

  return
end
