function [ h, hmin, hmax ] = p01_stepsize ( option )

%*****************************************************************************80
%
%% P01_STEPSIZE returns step sizes for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2008
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
  h =    0.30000;
  hmin = 0.03125;
  hmax = 4.00000;

  return
end
