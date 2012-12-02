function [ f1, f2, f3, f4, f5, s ] = r8_fehl ( f, neqn, y, t, h, yp )

%*****************************************************************************80
%
%% R8_FEHL takes one Fehlberg fourth-fifth order step.
%
%  Discussion:
%
%    This routine integrates a system of NEQN first order ordinary differential
%    equations of the form
%      dY(i)/dT = F(T,Y(1:NEQN))
%    where the initial values Y and the initial derivatives
%    YP are specified at the starting point T.
%
%    The routine advances the solution over the fixed step H and returns
%    the fifth order (sixth order accurate locally) solution
%    approximation at T+H in array S.
%
%    The formulas have been grouped to control loss of significance.
%    The routine should be called with an H not smaller than 13 units of
%    roundoff in T so that the various independent arguments can be
%    distinguished.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2010
%
%  Author:
%
%    Original FORTRAN77 version by Herman Watts, Lawrence Shampine.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Erwin Fehlberg,
%    Low-order Classical Runge-Kutta Formulas with Stepsize Control,
%    NASA Technical Report R-315, 1969.
%
%    Lawrence Shampine, Herman Watts, S Davenport,
%    Solving Non-stiff Ordinary Differential Equations - The State of the Art,
%    SIAM Review,
%    Volume 18, pages 376-411, 1976.
%
%  Parameters:
%
%    Input, function F, a user-supplied function to evaluate the
%    derivatives dYdT, of the form:
%
%      function yp = f ( t, y )
%
%    Input, integer NEQN, the number of equations to be integrated.
%
%    Input, real Y(NEQN), the current value of the
%    dependent variable.
%
%    Input, real T, the current value of the independent
%    variable.
%
%    Input, real H, the step size to take.
%
%    Input, real YP(NEQN), the current value of the
%    derivative of the dependent variable.
%
%    Output, real F1(NEQN), F2(NEQN), F3(NEQN), F4(NEQN),
%    F5(NEQN), derivative values needed for the computation.
%
%    Output, real S(NEQN), the estimate of the solution at T+H.
%
  ch = h / 4.0;

  f5(1:neqn) = y(1:neqn) + ch * yp(1:neqn);

  f1 = f ( t + ch, f5 );

  ch = 3.0 * h / 32.0;

  f5(1:neqn) = y(1:neqn) + ch * ( yp(1:neqn) + 3.0 * f1(1:neqn) );

  f2 = f ( t + 3.0 * h / 8.0, f5 );

  ch = h / 2197.0;

  f5(1:neqn) = y(1:neqn) + ch * ...
  ( 1932.0 * yp(1:neqn) ...
  + ( 7296.0 * f2(1:neqn) - 7200.0 * f1(1:neqn) ) ...
  );

  f3 = f ( t + 12.0 * h / 13.0, f5 );

  ch = h / 4104.0;

  f5(1:neqn) = y(1:neqn) + ch * ...
  ( ...
    ( 8341.0 * yp(1:neqn) - 845.0 * f3(1:neqn) ) ...
  + ( 29440.0 * f2(1:neqn) - 32832.0 * f1(1:neqn) ) ...
  );

  f4 = f ( t + h, f5 );

  ch = h / 20520.0;

  f1(1:neqn) = y(1:neqn) + ch * ...
  ( ...
    ( -6080.0 * yp(1:neqn) ...
    + ( 9295.0 * f3(1:neqn) - 5643.0 * f4(1:neqn) ) ...
    ) ...
  + ( 41040.0 * f1(1:neqn) - 28352.0 * f2(1:neqn) ) ...
  );

  f5 = f ( t + h / 2.0, f1 );
%
%  Ready to compute the approximate solution at T+H.
%
  ch = h / 7618050.0;

  s(1:neqn) = y(1:neqn) + ch * ...
  ( ...
    ( 902880.0 * yp(1:neqn) ...
    + ( 3855735.0 * f3(1:neqn) - 1371249.0 * f4(1:neqn) ) ) ...
  + ( 3953664.0 * f2(1:neqn) + 277020.0 * f5(1:neqn) ) ...
  );

  return
end
