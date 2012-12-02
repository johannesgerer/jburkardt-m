function yprime = threebp ( s, y )

%*****************************************************************************80
%
%% THREEBP evaluates the right hand side of the reduced three body ODE system.
%
%  Modified:
%
%    08 April 2011
%
%  Author:
%
%    Dominik Gruntz, Joerg Waldvogel
%
%  Reference:
%
%    Dominik Gruntz, Joerg Waldvogel,
%    "Orbits in the Planar Three-Body Problem",
%    Walter Gander, Jiri Hrebicek,
%    Solving Problems in Scientific Computing using Maple and Matlab,
%    Springer, 1997,
%    ISBN: 3-540-61793-0,
%    LC: Q183.9.G36.
%
%  Parameters:
%
%    Input, real S, the current (rescaled) time.
%
%    Input, real Y(8), the reduced state variables.
%
%    Output, real YPRIME(8), the right hand side of the ODE system.
%
  global m0 m1 m2 EE

  x1 = y(1);
  x2 = y(2);
  y1 = y(3);
  y2 = y(4);
  p1 = y(5);
  p2 = y(6);
  q1 = y(7);
  q2 = y(8);

  t1 = x1^2;
  t2 = x2^2;
  xx = t1 + t2;
  t3 = y1^2;
  t4 = y2^2;
  yy = t3 + t4;
  t5 = p1^2;
  t6 = p2^2;
  pp = t5 + t6;
  t7 = q1^2;
  t8 = q2^2;
  qq = t7 + t8;
  r0 = xx*yy;
  s0 = x1 - y2;
  s1 = x2 + y1;
  s2 = x1 + y2;
  s3 = x2 - y1;
  t9 = s0^2;
  t10 = s1^2;
  t11 = t9 + t10;
  t12 = s2^2;
  t13 = s3^2;
  t14 = t12 + t13;
  r1 = 1/4*t14*t11;
  s4 = x1 + y1;
  s5 = x2 + y2;
  s6 = x1 - y1;
  s7 = x2 - y2;
  t16 = s4^2;
  t17 = s5^2;
  t18 = t16 + t17;
  t19 = s6^2;
  t20 = s7^2;
  t21 = t19 + t20;
  r2 = 1/4*t21*t18;
  t25 = p1*q1 + p2*q2;
  t28 = x1*y1 + x2*y2;
  A = 2*t28*t25;
  t32 = p2*q1 - p1*q2;
  t35 = x2*y1 - x1*y2;
  B = 2*t35*t32;
  amb = A - B;
  t39 = pp*xx + qq*yy - A - B;
  t40 = pp*yy;
  t41 = qq*xx;
  t42 = t40 + t41 - amb;
  t43 = t40 + t41 + amb;
  m01 = m0*m1;
  m12 = m1*m2;
  m20 = m2*m0;
  t68 = -EE*r2;
  t48 = 1/32*1/m2;
  t50 = 1/32*1/m1;
  t52 = 1/32*1/m0;
  t49 = r2*t48;
  t51 = r1*t50;
  t54 = t49 - t51;
  t53 = r0*t52;
  t55 = -t53;
  t100 = -t54 + t55;
  t104 = t54 + t55;
  t60 = t43*t48 - m12*r1 - m20*r0 - EE*r0*r1;
  t61 = t18*t60;
  t120 = 1/2*s7*t61;
  t108 = 1/2*s6*t61;
  t121 = 1/2*t21*s5*t60;
  t109 = 1/2*t21*s4*t60;
  t73 = r0*t68 + t42*t50 - m01*r0 - m12*r2;
  t74 = t11*t73;
  t122 = 1/2*s3*t74;
  t110 = 1/2*s2*t74;
  t123 = 1/2*t14*s1*t73;
  t111 = 1/2*t14*s0*t73;
  t94 = r1*t68 + t39*t52 - m01*r1 - m20*r2;
  t161 = xx*t49 + xx*t51 + yy*t53;
  t146 = yy*t49 + yy*t51 + xx*t53;
  t131 = pp*t49 + pp*t51 + qq*t53 + xx*t94;
  t112 = qq*t49 + qq*t51 + pp*t53 + yy*t94;
  t101 = t32*t100;
  t105 = t25*t104;

  grd(1) = -2*y2*t101 + 2*y1*t105 + t108 + t109 + t110 + t111 + 2*x1*t112;
  grd(2) = 2*y1*t101 + 2*y2*t105 + t120 + t121 + t122 + t123 + 2*x2*t112;
  grd(3) = 2*x2*t101 + 2*x1*t105 - t108 + t109 - t122 + t123 + 2*y1*t131;
  grd(4) = -2*x1*t101 + 2*x2*t105 - t120 + t121 + t110 - t111 + 2*y2*t131;
  grd(5) = -2*t35*q2*t100 + 2*t28*q1*t104 + 2*p1*t146;
  grd(6) = 2*t35*q1*t100 + 2*t28*q2*t104 + 2*p2*t146;
  grd(7) = 2*t35*p2*t100 + 2*t28*p1*t104 + 2*q1*t161;
  grd(8) = -2*t35*p1*t100 + 2*t28*p2*t104 + 2*q2*t161;
%
%  Gather the data into YPRIME.
%
  yprime(1:4) = grd(5:8);
  yprime(5:8) = -grd(1:4);
  yprime(9) = r0*r1*r2;
%
%  Create a column vector for output.
%
  yprime = yprime(:);

  return
end
