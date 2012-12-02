function tcell_rom ( )

%*****************************************************************************80
%
%% TCELL_ROM solves an initial value problem (TCELL flow) using a reduced order model.
%
%  Discussion:
%
%    The function TCELL_RHS evaluates the right hand side of the ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2004
%
%  Author: 
%
%    Hyung-Chun Lee
%    Department of Mathematics
%    Ajou University, Korea
%
  load init.out

  load matrix.out
%
%  Set the time values.
%
  tspan = 0 : 0.0002 : 0.1;
  M = matrix(1:8,1:8);
%
%  Set the initial condition.
%
  y0 = init;
  y0 = inv ( M ) * y0';
%
%  Solve the differential equation.
%
  [ T, Y ] = ode113 ( @tcell_rhs, tspan, y0 );
%
%  Make a plot of the evolution of the coefficients over time.
%
  plot ( T, Y(:,1), T,Y(:,2), T,Y(:,3), T,Y(:,4), T,Y(:,5), T,Y(:,6), T,Y(:,7),   T,Y(:,8) );
%
%  Save the computed solutions.
%
  save odesol.txt Y -ASCII

  return
end
