function [ xstar, seed ] = rk2_tv_step ( x, t, h, q, fv, gv, seed )

%*****************************************************************************80
%
%% RK2_TV_STEP takes one step of a stochastic Runge Kutta scheme.
%
%  Discussion:
%
%    The Runge-Kutta scheme is second-order, and suitable for time-varying
%    systems.
%
%    d/dx X(t,xsi) = F ( X(t,xsi), t ) + G ( X(t,xsi), t ) * w(t,xsi)
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
%    Input, external real FV, the name of the deterministic
%    right hand side function.
%
%    Input, external real GV, the name of the stochastic
%    right hand side function.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real XSTAR, the value at time T+H.
%
  a21 = 1.0;
  a31 = 0.5;
  a32 = 0.5;

  q1 = 2.0;
  q2 = 2.0;

  t1 = t;
  x1 = x;
  [ n1, seed ] = r8_normal_01 ( seed );
  w1 = n1 * sqrt ( q1 * q / h );
  k1 = h * fv ( t1, x1 ) + h * gv ( t1, x1 ) * w1;

  t2 = t1 + a21 * h;
  x2 = x1 + a21 * k1;
  [ n2, seed ] = r8_normal_01 ( seed );
  w2 = n2 * sqrt ( q2 * q / h );
  k2 = h * fv ( t2, x2 ) + h * gv ( t2, x2 ) * w2;

  xstar = x1 + a31 * k1 + a32 * k2;

  return
end
