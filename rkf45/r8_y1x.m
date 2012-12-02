function y1x = r8_y1x ( t )

%*****************************************************************************80
%
%% R8_Y1X evaluates the exact solution of the ODE.
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
%    Output, real Y1X, the exact solution.
%
  y1x = 20.0 ./ ( 1.0 + 19.0 * exp ( - 0.25 * t ) );

  return
end
