function [ xstar, seed ] = rk4_ti_step ( x, t, h, q, fi, gi, seed )

%*****************************************************************************80
%
%% RK4_TI_STEP takes one step of a stochastic Runge Kutta scheme.
%
%  Discussion:
%
%    The Runge-Kutta scheme is fourth-order, and suitable for time-invariant
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
  a21 =   2.71644396264860;
  a31 = - 6.95653259006152;
  a32 =   0.78313689457981;
  a41 =   0.0;
  a42 =   0.48257353309214;
  a43 =   0.26171080165848;
  a51 =   0.47012396888046;
  a52 =   0.36597075368373;
  a53 =   0.08906615686702;
  a54 =   0.07483912056879;

  q1 =   2.12709852335625;
  q2 =   2.73245878238737;
  q3 =  11.22760917474960;
  q4 =  13.36199560336697;

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

  t4 = t1 + a41 * h  + a42 * h + a43 * h;
  x4 = x1 + a41 * k1 + a42 * k2;
  [ n4, seed ] = r8_normal_01 ( seed );
  w4 = n4 * sqrt ( q4 * q / h );
  k4 = h * fi ( x4 ) + h * gi ( x4 ) * w4;

  xstar = x1 + a51 * k1 + a52 * k2 + a53 * k3 + a54 * k4;

  return
end
