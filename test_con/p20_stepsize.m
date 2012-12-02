function [ h, hmin, hmax ] = p20_stepsize ( option )

%*****************************************************************************80
%
%% P20_STEPSIZE returns step sizes for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Output, real H, HMIN, HMAX, suggested values for the
%    initial step, the minimum step, and the maximum step.
%
  h =    0.00250;
  hmin = 0.01000;
  hmax = 0.08000;

  return
end
