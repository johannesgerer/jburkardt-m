function [ xstar, seed ] = rk4_tv_step ( x, t, h, q, fv, gv, seed )

%*****************************************************************************80
%
%% RK4_TV_STEP takes one step of a stochastic Runge Kutta scheme.
%
%  Discussion:
%
%    The Runge-Kutta scheme is fourth-order, and suitable for time-varying
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
  a21 =   0.66667754298442;
  a31 =   0.63493935027993;
  a32 =   0.00342761715422;
  a41 = - 2.32428921184321;
  a42 =   2.69723745129487;
  a43 =   0.29093673271592;
  a51 =   0.25001351164789;
  a52 =   0.67428574806272;
  a53 = - 0.00831795169360;
  a54 =   0.08401868181222;

  q1 = 3.99956364361748;
  q2 = 1.64524970733585;
  q3 = 1.59330355118722;
  q4 = 0.26330006501868;

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

  t3 = t1 + a31 * h  + a32 * h;
  x3 = x1 + a31 * k1 + a32 * k2;
  [ n3, seed ] = r8_normal_01 ( seed );
  w3 = n3 * sqrt ( q3 * q / h );
  k3 = h * fv ( t3, x3 ) + h * gv ( t3, x3 ) * w3;

  t4 = t1 + a41 * h  + a42 * h  + a43 * h;
  x4 = x1 + a41 * k1 + a42 * k2 + a43 * k3;
  [ n4, seed ] = r8_normal_01 ( seed );
  w4 = n4 * sqrt ( q4 * q / h );
  k4 = h * fv ( t4, x4 ) + h * gv ( t4, x4 ) * w4;

  xstar = x1 + a51 * k1 + a52 * k2 + a53 * k3 + a54 * k4;

  return
end
