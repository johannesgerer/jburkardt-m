function [ h, hmin, hmax ] = p10_stepsize ( option )

%*****************************************************************************80
%
%% P10_STEPSIZE returns step sizes for problem 10.
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
  h =     2.000;
  hmin =  0.001;
  hmax = 10.000;

  return
end
