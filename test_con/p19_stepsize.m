function [ h, hmin, hmax ] = p19_stepsize ( option )

%*****************************************************************************80
%
%% P19_STEPSIZE returns step sizes for problem 19.
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
  h =    0.125000;
  hmin = 0.015625;
  hmax = 4.000000;

  return
end
