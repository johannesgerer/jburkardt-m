function [ estimate, exact, error ] = stochastic_integral_strat ( n, seed )

%*****************************************************************************80
%
%% STOCHASTIC_INTEGRAL_STRAT approximates the Stratonovich integral of W(t) dW.
%
%  Discussion:
%
%    This function estimates the Stratonovich integral of W(t) dW over 
%    the interval [0,1].
%
%    The estimates is made by taking N steps.
%
%  Modified:
%
%    20 March 2012
%
%  Author:
%
%    Desmond Higham
%
%  Reference:
%
%    Desmond Higham,
%    An Algorithmic Introduction to Numerical Simulation of
%    Stochastic Differential Equations,
%    SIAM Review,
%    Volume 43, Number 3, September 2001, pages 525-546.
%
%  Parameters:
%
%    Input, integer N, the number of steps to take.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real ESTIMATE, the estimate of the integral.
%
%    Output, real EXACT, the exact value of the integral.
%
%    Output, real ERROR, the error in the integral estimate.
%
  if ( nargin < 1 )
    seed = 123456789;
    fprintf ( 1, '  Using default value of SEED = %d\n', seed );
  end
%
%  Initialize the random number generator.
%
  rng ( seed )

  tmax = 1.0;
  dt = tmax / n;
%
%  Set the increments.
%
  dw = sqrt ( dt ) * randn ( 1, n );
%
%  Set the cumulative sums.
%
  w = cumsum ( dw );
%
%  Approximate the Stratonovich integral.
%
  estimate = sum ( ( 0.5 * ( [0,w(1:end-1)] + w ) ...
    + 0.5 * sqrt ( dt ) * randn ( 1, n ) ) .* dw );
%
%  Compare with the exact solution.
%
  exact = 0.5 * w(end)^2;
  error = abs ( estimate - exact );

  return
end
