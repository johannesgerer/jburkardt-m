function y1 = p00_euler_step ( test, neqn, t0, y0, t1 )

%*****************************************************************************80
%
%% P00_EULER_STEP takes a single Euler step from (T0,Y0) to (T1,Y1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the problem number.
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T0, Y0(NEQN), the arguments of the derivative function.
%
%    Input, real T1, the point at which an estimate of the solution
%    is desired.
%
%    Output, real Y1(NEQN), the estimated solution at T1.
%
  dt = t1 - t0;

  yp0 = p00_fun ( test, t0, y0 );

  y1(1:neqn) = y0(1:neqn) + dt * yp0(1:neqn);

  return
end
