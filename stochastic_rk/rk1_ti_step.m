function [ xstar, seed ] = rk1_ti_step ( x, t, h, q, fi, gi, seed )

%*****************************************************************************80
%
%% RK1_TI_STEP takes one step of a stochastic Runge Kutta scheme.
%
%  Discussion:
%
%    The Runge-Kutta scheme is first-order, and suitable for time-invariant
%    systems in which F and G do not depend explicitly on time.
%
%    d/dx X(t,xsi) = F ( X(t,xsi) ) + G ( X(t,xsi) ) * w(t,xsi)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jeremy Kasdin,
%    Runge-Kutta algorithm for the numerical integration of
%    stochastic differential equations,
%    Journal of Guidance, Control, and Dynamics,
%    Volume 18, Number 1, January-February 1995, pages 114-120.
%
%    Jeremy Kasdin,
%    Discrete Simulation of Colored Noise and Stochastic Processes
%    and 1/f^a Power Law Noise Generation,
%    Proceedings of the IEEE,
%    Volume 83, Number 5, 1995, pages 802-827.
%
%  Parameters:
%
%    Input, real X, the value at the current time.
%
%    Input, real T, the current time.
%
%    Input, real H, the time step.
%
%    Input, real Q, the spectral density of the input white noise.
%
%    Input, external real FI, the name of the deterministic
%    right hand side function.
%
%    Input, external real GI, the name of the stochastic
%    right hand side function.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real XSTAR, the value at time T+H.
%
  a21 = 1.0;

  q1 = 1.0;

  t1 = t;
  x1 = x;
  [ n1, seed ] = r8_normal_01 ( seed );
  w1 = n1 * sqrt ( q1 * q / h );
  k1 = h * fi ( x1 ) + h * gi ( x1 ) * w1;

  xstar = x1 + a21 * k1;

  return
end
