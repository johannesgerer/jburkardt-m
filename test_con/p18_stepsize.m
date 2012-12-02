function [ h, hmin, hmax ] = p18_stepsize ( option )

%*****************************************************************************80
%
%% P18_STEPSIZE returns step sizes for problem 18.
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
  h =    2.500;
  hmin = 0.001;
  hmax = 5.000;

  return
end
