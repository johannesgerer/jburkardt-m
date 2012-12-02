function [ h, hmin, hmax ] = p06_stepsize ( option )

%*****************************************************************************80
%
%% P06_STEPSIZE returns step sizes for problem 6.
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
  h =    0.250;
  hmin = 0.001;
  hmax = 0.500;

  return
end
