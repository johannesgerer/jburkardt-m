function yp = r8_f2 ( t, y )

%*****************************************************************************80
%
%% R8_F2 evaluates the derivative for the ODE.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, real T, the value of the independent variable.
%
%    Input, real Y(NEQN), the value of the dependent variable.
%
%    Output, real YP(NEQN), the value of the derivative
%    dY(1:NEQN)/dT.
%
  yp(1) =  y(2);
  yp(2) = -y(1);

  return
end
