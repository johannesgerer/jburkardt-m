function [ xstar, seed ] = rk3_ti_step ( x, t, h, q, fi, gi, seed )

%*****************************************************************************80
%
%% RK3_TI_STEP takes one step of a stochastic Runge Kutta scheme.
%
%  Discussion:
%
%    The Runge-Kutta scheme is third-order, and suitable for time-invariant
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
  a21 = 1.52880952525675;
  a31 = 0.0;
  a32 = 0.51578733443615;
  a41 = 0.53289582961739;
  a42 = 0.25574324768195;
  a43 = 0.21136092270067;

  q1 = 1.87653936176981;
  q2 = 3.91017166264989;
  q3 = 4.73124353935667;

  t1 = t;
  x1 = x;
  [ n1, seed ] = r8_normal_01 ( seed );
  w1 = n1 * sqrt ( q1 * q / h );
  k1 = h * fi ( x1 ) + h * gi ( x1 ) * w1;

  t2 = t1 + a21 * h;
  x2 = x1 + a21 * k1;
  [ n2, seed ] = r8_normal_01 ( seed );
  w2 = n2 * sqrt ( q2 * q / h );
  k2 = h * fi ( x2 ) + h * gi ( x2 ) * w2;

  t3 = t1 + a31 * h  + a32 * h;
  x3 = x1 + a31 * k1 + a32 * k2;
  [ n3, seed ] = r8_normal_01 ( seed );
  w3 = n3 * sqrt ( q3 * q / h );
  k3 = h * fi ( x3 ) + h * gi ( x3 ) * w3;

  xstar = x1 + a41 * k1 + a42 * k2 + a43 * k3;

  return
end
