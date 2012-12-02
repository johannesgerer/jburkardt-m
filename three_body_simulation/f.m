function Ydot = f ( t, Y )

%*****************************************************************************80
%
%% F returns the right hand side of the three body ode system.
%
%  Modified:
%
%    12 April 2011
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
%    Input, real T, the current time.
%
%    Input, real Y(12), the current solution.
%
%    Output, real YDOT(12), the derivatives of the current solution.
%
  global m0
  global m1
  global m2

  x0 = Y(1:2); x1 = Y(5:6); x2 = Y(9:10);
  d0 = (x2-x1)/norm(x2-x1)^3;
  d1 = (x0-x2)/norm(x0-x2)^3;
  d2 = (x1-x0)/norm(x1-x0)^3;

  Ydot( 1: 2) = Y( 3: 4);
  Ydot( 5: 6) = Y( 7: 8);
  Ydot( 9:10) = Y(11:12);
  Ydot( 3: 4) = m1*d2 - m2*d1;
  Ydot( 7: 8) = m2*d0 - m0*d2;
  Ydot(11:12) = m0*d1 - m1*d0;
%
%  Return results as a column vector.
%
  Ydot = Ydot(:);

  return
end
