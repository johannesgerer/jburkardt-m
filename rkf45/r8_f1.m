function yp = r8_f1 ( t, y )

%*****************************************************************************80
%
%% R8_F1 evaluates the derivative for the ODE.
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
%    Input, real Y, the value of the dependent variable.
%
%    Output, real YP, the value of the derivative
%    dY(1:NEQN)/dT.
%
  yp = zeros ( size ( y ) );

  yp = 0.25 * y * ( 1.0 - y / 20.0 );

  return
end
